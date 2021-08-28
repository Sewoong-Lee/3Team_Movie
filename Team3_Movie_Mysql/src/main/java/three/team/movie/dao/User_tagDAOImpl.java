package three.team.movie.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class User_tagDAOImpl implements User_tagDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void tagSelected(Map<String, String> tagMap)  throws Exception {
		sqlSession.insert("three.team.movie.User_tagMapper.tagSelected", tagMap);
	}
	@Override
	public List<Map<String, String>> getUserTag(String user_id)  throws Exception {
		return sqlSession.selectList("three.team.movie.User_tagMapper.getUserTag", user_id);
	}
	@Override
	public void delete(String user_id)  throws Exception {
		sqlSession.delete("three.team.movie.User_tagMapper.delete", user_id);
	}

}
