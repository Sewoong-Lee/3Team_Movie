package three.team.movie.dao;

import java.util.List;
import java.util.Map;

import three.team.movie.dto.Mv_user;

public interface Mv_userDAO {
	public void insert(Mv_user mv_user) throws Exception ;

	public Mv_user selectOne(String userid) throws Exception ;

	public void insertNaverLogin(Map<String, String> resultMap) throws Exception ;

	public Map<String, String> emailChecked(String email) throws Exception ;

	public void delete(String user_id) throws Exception ;

	public void update(Map<String, Object> newInfoMap) throws Exception ;

	public void updatePw(Map<String, String> newPwMap) throws Exception ;

	public List<Map<String, Object>> getsaleslist(String user_id) throws Exception ;

	public Mv_user findMyId(String email) throws Exception ;

	public void sal_delete(int sal_num) throws Exception ;


}
