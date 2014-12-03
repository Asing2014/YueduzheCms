package api;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import bean.Content;

/**
 * Servlet implementation class ContentServlet
 */
public class ContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ContentServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		if("get".equalsIgnoreCase(method)){
			//查询
			String id = request.getParameter("id");
			String resource = "config/mybatis/db.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sqlSessionFactory.openSession();
			try {
			  Content content = (Content) session.selectOne("config.mybatis.ContentMapper.selectContentById", id);
			  JSONObject contentJsonObject = JSONObject.fromObject(content);
			  response.getWriter().write(contentJsonObject.toString());
			} finally {
			  session.close();
			}
		}
		//删除
		if("delete".equalsIgnoreCase(method)){
			//查询
			String id = request.getParameter("id");
			String resource = "config/mybatis/db.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sqlSessionFactory.openSession();
			try {
			  int result = session.delete("config.mybatis.ContentMapper.deleteContentById", id);
			  session.commit();
			  response.getWriter().write(result+"");
			} finally {
			  session.close();
			}
		}
		//更新
		if("update".equalsIgnoreCase(method)){
			//查询
			String c = request.getParameter("c");
			JSONObject object = JSONObject.fromObject(c);
			Content content = new Content();
			content.setContent(object.getString("content"));
			content.setDesc(object.getString("description"));
			content.setImage_url(object.getString("image_url"));
			content.setState(object.getString("state"));
			content.setTitle(object.getString("title"));
			content.setType(object.getString("type"));
			content.setUrl(object.getString("url"));
			content.setUser(object.getString("user"));
			content.setId(object.getString("id"));
			String resource = "config/mybatis/db.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sqlSessionFactory.openSession();
			try {
			  int result = session.update("config.mybatis.ContentMapper.updateContentById",content );
			  session.commit();
			  response.getWriter().write(result+"");
			} finally {
			  session.close();
			}
		}
		if("add".equalsIgnoreCase(method)){
			//增加
			String c = request.getParameter("c");
			JSONObject object = JSONObject.fromObject(c);
			Content content = new Content();
			content.setContent(object.getString("content"));
			content.setDesc(object.getString("description"));
			content.setImage_url(object.getString("image_url"));
			content.setState(object.getString("state"));
			content.setTitle(object.getString("title"));
			content.setType(object.getString("type"));
			content.setUrl(object.getString("url"));
			content.setUser(object.getString("user"));
			
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
		return;
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
