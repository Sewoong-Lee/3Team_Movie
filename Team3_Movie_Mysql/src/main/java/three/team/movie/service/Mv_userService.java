package three.team.movie.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import three.team.movie.dto.Mv_user;

public interface Mv_userService {
	public void insert(Mv_user mv_user, MultipartFile profile) throws Exception;

	public  Map<String, Object> overlap(String userid) throws Exception ;

	public Map<String, String> emailChecked(String email) throws Exception ;

	public Map<String, Object> login(String user_id, String passwd) throws Exception ;

	public Mv_user selectOne(String user_id) throws Exception ;

	public void delete(String user_id) throws Exception ;

	public void update(List<String> newTag, Map<String, Object> param, MultipartFile profile) throws Exception ;

	public void updatePw(String user_id, String newPw) throws Exception ;

	public List<Map<String, Object>> getsaleslist(String user_id) throws Exception ;

	public Mv_user findMyId(String email) throws Exception ;

	public void sal_delete(int sal_num) throws Exception ;


}
