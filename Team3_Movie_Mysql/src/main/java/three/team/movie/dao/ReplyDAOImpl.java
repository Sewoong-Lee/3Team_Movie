package three.team.movie.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.team.movie.dto.Mv_movie_reply;

@Repository
public class ReplyDAOImpl implements ReplyDAO{

	@Autowired
	private SqlSession sqlSession;
	
	//댓글 추가 
	@Override
	public void insert(Mv_movie_reply reply)  throws Exception {
		sqlSession.insert("org.spring.my.ReplyMapper.insert",reply);
	}
	//댓글 전체리스트
	@Override
	public List<Map<String, Object>> selectList(Map<String, Object> replyMap)  throws Exception {
		System.out.println("DDDDD=========="+replyMap+"dao-----------------");
		return sqlSession.selectList("org.spring.my.ReplyMapper.selectList",replyMap);
	}

	//댓글 디테일
	@Override
	public Mv_movie_reply selectOne(int mr_num) throws Exception  {
		
		return sqlSession.selectOne("org.spring.my.ReplyMapper.selectOne",mr_num);
	}
	
	//댓글 삭제 
	@Override
	public void delete(int mr_num)  throws Exception {
		sqlSession.delete("org.spring.my.ReplyMapper.delete",mr_num);
	}
	//원본글 수정
	@Override
	public void modify(Mv_movie_reply reply)  throws Exception {
		sqlSession.update("org.spring.my.ReplyMapper.update",reply);
		
	}
	//영화 게시물 수 구하기 
	@Override
	public int totReplCnt(int movie_num) throws Exception {
		return sqlSession.selectOne("org.spring.my.ReplyMapper.totReplCnt",movie_num);
	}
	
	//회원 세션아이디 게시물번호 일치여부 확인 
	@Override
	public int selectOneUpCheck(int mr_num, String user_id)  throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mr_num", mr_num);
		map.put("user_id", user_id);
		return sqlSession.selectOne("org.spring.my.ReplyMapper.selectOneUpcheck",map);
	}
	


	
}
