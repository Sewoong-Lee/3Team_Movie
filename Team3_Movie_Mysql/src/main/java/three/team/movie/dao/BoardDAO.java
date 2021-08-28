package three.team.movie.dao;

import java.util.List;
import java.util.Map;

import three.team.movie.dto.MV_Board_Page;
import three.team.movie.dto.Mv_board;
import three.team.movie.dto.Mv_state;

public interface BoardDAO {

	public List<Mv_board> eventlist() throws Exception ;

	public Mv_board selectone_board(int board_num) throws Exception ;

	public void insert(Mv_board mv_board) throws Exception ;

	public void board_delete(int board_num) throws Exception ;

	public int selecttotcnt(MV_Board_Page mv_board_page) throws Exception ;

	public List<Map<String, Object>> selectlist(MV_Board_Page mv_board_page) throws Exception ;

	public Object state_selectone(Mv_state mv_state) throws Exception ;

	public void state_insert(Mv_state mv_state) throws Exception ;

	public void readcountadd(int board_num) throws Exception ;

	public void board_update(Mv_board mv_board) throws Exception ;

}
