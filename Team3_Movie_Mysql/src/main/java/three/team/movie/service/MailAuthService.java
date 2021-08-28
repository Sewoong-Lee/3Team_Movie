package three.team.movie.service;


public interface MailAuthService {
	public String sendMail(String email) throws Exception;

	public void findMyId(String email, String user_id) throws Exception;

	public void findMyPw(String email, String user_id) throws Exception;

}
