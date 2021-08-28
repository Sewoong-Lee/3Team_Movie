package three.team.movie.service;

import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class MailAuthServiceImpl implements MailAuthService {

	@Autowired
	private JavaMailSenderImpl mailSender;
	@Autowired
	private Mv_userService mv_userService;
	
	public String getAuthCode() {
		StringBuffer authCode = new StringBuffer();
		Random random = new Random();
		for (int i = 0 ; i<6 ; i++) {
			int code = random.nextInt(10);
			authCode.append(code);
		}
		return authCode.toString();
	}
	
	@Override
	public String sendMail(String email) throws Exception {
		String authCode = getAuthCode();
		StringBuffer mailContent = new StringBuffer();
		//메일 내용
		mailContent.append("<h2>CCV 가입을 위한 메일 인증을 진행해주세요.</h2>");
		//회원 정보 입력 페이지로 이동할 수 있도록 하이퍼링크 생성
		mailContent.append("<a href ='http://118.67.135.173:8080/ccv/codeCheck");
		mailContent.append("?email="+email+"&authCode="+authCode+"'>이 곳을 클릭해주세요.</a>");
		
		//메일 보낼 객체 생성
		MimeMessage mimeMail = mailSender.createMimeMessage();
		//메일 제목
		mimeMail.setSubject("[당신의 취향에 가장 완벽한 선택, CCV]", "UTF-8");
		mimeMail.setText(mailContent.toString(), "UTF-8", "html");
		mimeMail.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
		
		//메일 전송
		mailSender.send(mimeMail);
		return authCode;
	}

	@Override
	public void findMyId(String email, String user_id) throws Exception {
		StringBuffer mailContent = new StringBuffer();
		mailContent.append("<h2>회원님의 CCV 아이디는 다음과 같습니다.</h2>");
		mailContent.append("<p style=\"font-size: large;\">아이디 : <b>"+user_id+"</b></p>");
		mailContent.append("<a href = 'http://118.67.135.173:8080/ccv/user/login'>CCV 로그인하러 가기</a>");
		//메일 보낼 객체 생성
		MimeMessage mimeMail = mailSender.createMimeMessage();
		//메일 제목
		mimeMail.setSubject("[당신의 취향에 가장 완벽한 선택, CCV] 아이디 찾기", "UTF-8");
		
		mimeMail.setText(mailContent.toString(), "UTF-8", "html");
		mimeMail.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
		
		mailSender.send(mimeMail);
	}

	@Override
	public void findMyPw(String email, String user_id) throws Exception {
		StringBuffer mailContent = new StringBuffer();
		mailContent.append("<h2>CCV 회원 인증이 완료되었습니다.</h2>");
		mailContent.append("<a href = 'http://118.67.135.173:8080/ccv/user/modifyPw");
		mailContent.append("?user_id="+user_id+"'>CCV 비밀번호 변경하러 가기</a>");
		//메일 보낼 객체 생성
		MimeMessage mimeMail = mailSender.createMimeMessage();
		//메일 제목
		mimeMail.setSubject("[당신의 취향에 가장 완벽한 선택, CCV] 비밀번호 찾기", "UTF-8");
		
		mimeMail.setText(mailContent.toString(), "UTF-8", "html");
		mimeMail.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
		
		mailSender.send(mimeMail);
	}

	
}
