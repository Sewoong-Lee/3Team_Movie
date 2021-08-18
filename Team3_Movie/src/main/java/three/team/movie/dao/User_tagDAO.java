package three.team.movie.dao;

import java.util.List;
import java.util.Map;

public interface User_tagDAO {
	public void tagSelected(Map<String, String> tagMap);
	public List<Map<String, String>> getUserTag(String user_id);
	public void delete(String user_id);
	
}
