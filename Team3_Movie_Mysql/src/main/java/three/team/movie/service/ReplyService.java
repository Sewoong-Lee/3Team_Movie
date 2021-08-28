package three.team.movie.service;

import java.util.List;
import java.util.Map;

import three.team.movie.dto.Mv_movie_reply;

public interface ReplyService {

	public void insert(Mv_movie_reply reply) throws Exception ; //댓글 추가

	public List<Map<String, Object>> selectList(Map<String, Object> replyMap) throws Exception ; //원본글 리스트 

	public Mv_movie_reply selectOne(int mr_num) throws Exception ; //원본글 디테일 

	public void delete(int mr_num) throws Exception ; //원본글 삭제 

	public void modify(Mv_movie_reply reply) throws Exception ; //원본글 수정

	public int selectOneUpCheck(int mr_num, String user_id) throws Exception ; //게시물 번호 회원 세션아이디 일치여부 확인 


}
