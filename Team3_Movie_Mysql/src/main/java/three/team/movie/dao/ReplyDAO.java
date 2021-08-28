package three.team.movie.dao;

import java.util.List;
import java.util.Map;

import three.team.movie.dto.Mv_movie_reply;

public interface ReplyDAO {

	public void insert(Mv_movie_reply reply) throws Exception ; //댓글 추가
	
	public List<Map<String, Object>> selectList(Map<String, Object> replyMap) throws Exception ; //댓글리스트 
	
	public Mv_movie_reply selectOne(int mr_num) throws Exception ; //댓글디테일

	public void delete(int mr_num) throws Exception ;	//원본글 삭제 

	public void modify(Mv_movie_reply reply) throws Exception ; //원본글 수정

	public int totReplCnt(int movie_num) throws Exception ; //영화 게시물 수 구하기 

	public int selectOneUpCheck(int mr_num, String user_id) throws Exception ; //회원 세션아이디 게시물번호 일치여부 확인 
	
	
}
