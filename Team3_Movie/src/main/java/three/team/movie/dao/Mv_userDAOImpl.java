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
	public void insert(Mv_user mv_user) {
		sqlSession.insert("three.team.movie.Mv_userMapper.insert", mv_user);
	}

	@Override
	public Mv_user selectOne(String userid) {
		return sqlSession.selectOne("three.team.movie.Mv_userMapper.selectOne", userid);
	}

	@Override
	public void insertNaverLogin(Map<String, String> resultMap) {
		sqlSession.insert("three.team.movie.Mv_userMapper.insertNaverLogin", resultMap);
	}

	@Override
	public Map<String, String> emailChecked(String email) {
		return sqlSession.selectOne("three.team.movie.Mv_userMapper.emailChecked", email);
	}

	@Override
	public void delete(String user_id) {
		sqlSession.selectOne("three.team.movie.Mv_userMapper.delete", user_id);
	}

	@Override
	public void update(Map<String, Object> newInfoMap) {
		sqlSession.update("three.team.movie.Mv_userMapper.update", newInfoMap);
	}

	@Override
	public void updatePw(Map<String, String> newPwMap) {
		sqlSession.update("three.team.movie.Mv_userMapper.updatePw", newPwMap);
	}

	@Override
	public List<Map<String, Object>> getsaleslist(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("three.team.movie.Mv_userMapper.getsaleslist", user_id);
	}
	
	@Override
	public Mv_user findMyId(String email) {
		return sqlSession.selectOne("three.team.movie.Mv_userMapper.findMyId", email);

	}

	@Override
	public void sal_delete(int sal_num) {
		sqlSession.delete("three.team.movie.Mv_userMapper.sal_delete", sal_num);
		
	}


}
