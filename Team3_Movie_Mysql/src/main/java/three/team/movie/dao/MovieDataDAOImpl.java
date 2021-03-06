package three.team.movie.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import three.team.movie.dto.Mv_Page;
import three.team.movie.dto.Mv_movie_data;


@Repository
public class MovieDataDAOImpl implements MovieDataDAO{

	@Autowired
	private SqlSession sqlsession;

	
	//영화 한건조회 detail
	@Override
	public  Map<String, Object> selectOne(int movie_num)  throws Exception {
		System.out.println("dao:"+movie_num);
		return sqlsession.selectOne("three.team.movie.MovieMapper.selectOne",movie_num);
	}

	//영화 전체 리스트 
	@Override
	public List<Mv_movie_data> selectList(Mv_Page page)  throws Exception {
		return sqlsession.selectList("three.team.movie.MovieMapper.selectList",page);
	}

	//회원 관심 리스트
	@Override
	public List<Map<String, Object>> selectListUser(Map<String, Object> findmap)  throws Exception {
		return sqlsession.selectList("three.team.movie.MovieMapper.selectListUser",findmap);
	}

	//영화 전체 수 구하기 
	@Override
	public int selectTotCnt(Mv_Page page)  throws Exception {
		return sqlsession.selectOne("three.team.movie.MovieMapper.selectTotCnt",page);
	}
	//회원 관심영화 리스트 수 구하기
	@Override
	public int selectTotCntUser(String user_id)  throws Exception {
	
		return sqlsession.selectOne("three.team.movie.MovieMapper.selectTotCntUser",user_id);
	}

	//영화 추가 
	@Override
	public void insert(Mv_movie_data mv_movie_data)  throws Exception {
		sqlsession.insert("three.team.movie.MovieMapper.insert", mv_movie_data);
	}

	//별평점 계산 
	@Override
	public Double starRating(int movie_num)  throws Exception {
	
		return sqlsession.selectOne("three.team.movie.MovieMapper.starRating",movie_num);
	}

	//유튜브 링크 인서트
	@Override
	public void youtubeLink_Inset(String youtube_link ,int movie_num)  throws Exception { 
		Map<String, Object> youtubemap = new HashMap<String, Object>();
		youtubemap.put("youtube_link",youtube_link);
		youtubemap.put("movie_num",movie_num);
		System.out.println("youtub확인==="+youtubemap);
		sqlsession.update("three.team.movie.MovieMapper.youtubeLink_Inset",youtubemap);
	}
	
	
	
	


	
}
