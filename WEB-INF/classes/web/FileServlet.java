package web;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileItemIterator;
import org.apache.tomcat.util.http.fileupload.FileItemStream;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import bean.Content;

/**
 * Servlet implementation class FileServlet
 */
public class FileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method = request.getParameter("method");
		if("add".equalsIgnoreCase(method)){
			//取得客户端的网络地址
			String remoteAddr = request.getRemoteAddr();

			//获得服务器的名字
			String serverName = request.getServerName();
			//取得互联网程序的绝对地址
			String realPath = request.getRealPath(serverName);
			realPath = realPath.substring(0,realPath.lastIndexOf("\\"));
			//创建文件的保存目录
			String rootPath;
			//声明文件读入类
			DataInputStream in = null;
			FileOutputStream fileOut = null;
			rootPath = realPath + "\\upload\\";
			String contentType = request.getContentType();
			if(contentType.indexOf("multipart/form-data") >= 0){
				int formDataLength = request.getContentLength();
				in = new DataInputStream(request.getInputStream());
				byte dataBytes[] = new byte[formDataLength];
				int byteRead = 0;
				int totalBytesRead = 0;
				//上传的数据保存在byte数组
				while(totalBytesRead < formDataLength){
				byteRead = in.read(dataBytes,totalBytesRead,formDataLength);
				totalBytesRead += byteRead;
				}
				//根据byte数组创建字符串
				String file = new String(dataBytes);
				//out.println(file);
				//取得上传的数据的文件名
				String saveFile = file.substring(file.indexOf("filename=\"") + 10);
				saveFile = saveFile.substring(0,saveFile.indexOf("\n"));
				saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
				int lastIndex = contentType.lastIndexOf("=");
				//取得数据的分隔字符串
				String boundary = contentType.substring(lastIndex + 1,contentType.length());
				//创建保存路径的文件名
				String fileName = rootPath + saveFile;
				fileName=new String(fileName.getBytes("iso-8859-1"));
				//out.print(fileName);
				int pos;
				pos = file.indexOf("filename=\"");
				pos = file.indexOf("\n",pos) + 1;
				pos = file.indexOf("\n",pos) + 1;
				pos = file.indexOf("\n",pos) + 1;
				int boundaryLocation = file.indexOf(boundary,pos) - 4;
				//out.println(boundaryLocation);
				//取得文件数据的开始的位置
				int startPos = ((file.substring(0,pos)).getBytes()).length;
				//out.println(startPos);
				//取得文件数据的结束的位置
				int endPos = ((file.substring(0,boundaryLocation)).getBytes()).length;
				//out.println(endPos);
				//检查上载文件是否存在
				File checkFile = new File(fileName);
				if(checkFile.exists()){
				//out.println("<p>" + saveFile + "文件已经存在.</p>");
				}
				//检查上载文件的目录是否存在
				File fileDir = new File(rootPath);
				if(!fileDir.exists()){
				fileDir.mkdirs();
				}
				//创建文件的写出类
				fileOut = new FileOutputStream(fileName);
				//保存文件的数据
				fileOut.write(dataBytes,startPos,(endPos - startPos));
				fileOut.close();
				//文件上传成功。保存路劲信息，存储到数据库。
				Content content = new Content();
				content.setUrl(fileName);
				
				String resource = "config/mybatis/db.xml";
				InputStream inputStream = Resources.getResourceAsStream(resource);
				SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
				SqlSession session = sqlSessionFactory.openSession();
				try {
					session.insert("config.mybatis.ContentMapper.addContent", content);
					session.commit();
				} finally {
				  session.close();
				}
				
				}else{
				String content = request.getContentType();
				//out.println("<p>上传的数据类型不是multipart/form-data</p>");
				
				}
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if("add".equalsIgnoreCase(method)){
		//设置文件编码
        request.setCharacterEncoding("UTF-8");
        //判断form表单的enctype属性是否是  multipart/form-data
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if(isMultipart){
            //获取FileItemFactory
            FileItemFactory factory = new DiskFileItemFactory();
            //获取ServletFileUpload
            ServletFileUpload upload = new ServletFileUpload(factory);
            try {
                FileItemIterator iterator = upload.getItemIterator(request);
                while(iterator.hasNext()){
                    FileItemStream fileItemStream = iterator.next();
                    String fieldName = fileItemStream.getFieldName();
                    String contentType = fileItemStream.getContentType();
                    String name = fileItemStream.getName();
                    int index = name.lastIndexOf("\\");
                    name = name.substring(index + 1);
                    System.out.println("fieldName:"+fieldName);
                    System.out.println("contentType:"+contentType);
                    System.out.println("name:"+name);
                    if(!fileItemStream.isFormField()){ 
                        InputStream is = fileItemStream.openStream();
                        OutputStream os = new FileOutputStream(new File("D:/",name));
                        int length = 0 ;
                        byte [] buf = new byte[1024];
                        while( (length = is.read(buf) ) != -1){
                            os.write(buf, 0, length);
                        }
                        is.close();
                        os.close();
                    }
                  //文件上传成功。保存路劲信息，存储到数据库。
    				Content content = new Content();
    				content.setUrl(name);
    				
    				String resource = "config/mybatis/db.xml";
    				InputStream inputStream = Resources.getResourceAsStream(resource);
    				SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
    				SqlSession session = sqlSessionFactory.openSession();
    				try {
    					session.insert("config.mybatis.ContentMapper.addContent", content);
    					session.commit();
    				} finally {
    				  session.close();
    				}
                }
                 
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.sendRedirect("upload.jsp?msg=1");
        }else{
            System.out.println("请将form表单的enctype属性设置为multipart/form-data");
        }
		}
	}

}
