/**
 * 
 */
package util;

import java.io.File;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;

/**
 * @author Administrator
 *
 */
public class FreeMarkertUtil {
	public static void analysisTemplate(String templateName,String templateEncoding,Map<?, ?> root){
		try {
			Configuration config = new Configuration();
			File file = new File("E:/10_workspace/YueduzheCms/WebContent/admin");
			System.out.println(file.getAbsolutePath());
			config.setDirectoryForTemplateLoading(file);
			config.setObjectWrapper(new DefaultObjectWrapper());
			Template template = config.getTemplate(templateName,templateEncoding);
			Writer out = new OutputStreamWriter(System.out);
			template.process(root, out);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void analysisTemplate(HttpServletRequest request,HttpServletResponse response,String templateName,String templateEncoding,Map<?, ?> root){
		try {
			ServletContext sc = request.getServletContext();
			Configuration config = new Configuration();
			config.setServletContextForTemplateLoading(sc,"WEB-INF/templates/admin");
			config.setObjectWrapper(new DefaultObjectWrapper());
			Template template = config.getTemplate(templateName,templateEncoding);
			Writer out = response.getWriter();
			template.process(root, out);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
