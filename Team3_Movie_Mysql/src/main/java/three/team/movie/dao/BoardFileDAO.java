package three.team.movie.dao;

import java.util.List;
import java.util.Map;

import three.team.movie.dto.Mv_board_file;

public interface BoardFileDAO {

	public void insertboardfile(Map<String, Object> fmap) throws Exception ;

	public List<Mv_board_file> select_board_filelist(int board_num) throws Exception ;

	public void board_file_delete(int board_num) throws Exception ;

	public void board_filr_delete(int board_file_num) throws Exception ;

}
