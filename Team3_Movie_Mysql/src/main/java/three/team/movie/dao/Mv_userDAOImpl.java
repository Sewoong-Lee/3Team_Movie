package three.team.movie.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.team.movie.dto.Mv_user;

@Repository
public class Mv_userDAOImpl implements Mv_userDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(Mv_user mv_user)  throws Exception {
		sqlSession.insert("three.team.movie.Mv_userMapper.insert", mv_user);
	}

	@Override
	public Mv_user selectOne(String userid)  throws Exception {
		return sqlSession.selectOne("three.team.movie.Mv_userMapper.selectOne", userid);
	}

	@Override
	public void insertNaverLogin(Map<String, String> resultMap)  throws Exception {
		sqlSession.insert("three.team.movie.Mv_userMapper.insertNaverLogin", resultMap);
	}

	@Override
	public Map<String, String> emailChecked(String email)  throws Exception {
		return sqlSession.selectOne("three.team.movie.Mv_userMapper.emailChecked", email);
	}

	@Override
	public void delete(String user_id)  throws Exception {
		sqlSession.selectOne("three.team.movie.Mv_userMapper.delete", user_id);
	}

	@Override
	public void update(Map<String, Object> newInfoMap)  throws Exception {
		sqlSession.update("three.team.movie.Mv_userMapper.update", newInfoMap);
	}

	@Override
	public void updatePw(Map<String, String> newPwMap)  throws Exception {
		sqlSession.update("three.team.movie.Mv_userMapper.updatePw", newPwMap);
	}

	@Override
	public List<Map<String, Object>> getsaleslist(String user_id) throws Exception  {
		// TODO Auto-generated method stub
		return sqlSession.selectList("three.team.movie.Mv_userMapper.getsaleslist", user_id);
	}
	
	@Override
	public Mv_user findMyId(String email) throws Exception  {
		return sqlSession.selectOne("three.team.movie.Mv_userMapper.findMyId", email);

	}

	@Override
	public void sal_delete(int sal_num) throws Exception  {
		sqlSession.delete("three.team.movie.Mv_userMapper.sal_delete", sal_num);
		
	}


}
