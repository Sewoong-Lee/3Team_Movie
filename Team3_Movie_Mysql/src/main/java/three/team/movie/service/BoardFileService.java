package three.team.movie.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import three.team.movie.dto.Mv_board_file;

public interface BoardFileService {
	public String fileupload(MultipartFile file) throws Exception ;
	//public void insertboardfile(Map<String, Object> fmap);
	public void insertdoardfilelist(List<MultipartFile> files, int bnum) throws Exception ;
	public List<Mv_board_file> select_board_filelist(int board_num) throws Exception ;
	public void board_file_delete(int board_num) throws Exception ;
	public void board_filr_delete(int board_file_num) throws Exception ;
}
