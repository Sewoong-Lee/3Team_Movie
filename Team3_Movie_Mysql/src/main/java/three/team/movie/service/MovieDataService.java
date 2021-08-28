package three.team.movie.service;

import java.util.List;
import java.util.Map;

import three.team.movie.dto.Mv_Page;
import three.team.movie.dto.Mv_movie_data;

public interface MovieDataService {

	public Map<String, Object> selectOne(int movie_num) throws Exception ; //영화 한건조회 detail

	public Map<String, Object> selectList(Mv_Page page) throws Exception ; //영화 리스트 

	public List<Map<String, Object>> selectListUser(Map<String, Object> findmap) throws Exception ;//회원관심 리스트

	public Map<String, Object> replyPaging(int movie_num, int curPage) throws Exception ; //게시물 페이징

	public Map<String, Object> selectMainList(Mv_Page page) throws Exception ; //메인리스트로 


}
