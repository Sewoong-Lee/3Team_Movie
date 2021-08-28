package three.team.movie.service;

import java.util.List;
import java.util.Map;

import three.team.movie.dto.MV_Board_Page;
import three.team.movie.dto.Mv_board;

public interface BoardService {

	public List<Map<String,Object>> boardlist(MV_Board_Page mv_board_page) throws Exception ;

	public Map<String, Object> selectone(int board_num) throws Exception ;

	public void insert(Mv_board mv_board) throws Exception ;

	public void board_delete(int board_num) throws Exception ;

	public void readcountadd(int board_num, String user_id) throws Exception ;

	public void board_update(Mv_board mv_board, List<Integer> filedeletelist) throws Exception ;

}
