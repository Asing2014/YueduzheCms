/**
 * 
 */
package mapper;

import org.apache.ibatis.annotations.Insert;

import bean.Content;

/**
 * @author Administrator
 *
 */
public interface ContentMapper {
	@Insert("insert into Content(title,description,image_url,url,content,type,state,user) values(#{title},#{desc},#{image_url},#{url},#{content},#{type},#{state},#{user})")
	void addContent(Content content);//增
	void deleteContentById(String id);//删
	void updateContent(Content oldContent,Content newContent);//改
	void selectContentById(String id);//精确查询
}
