package three.team.movie.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import three.team.movie.dto.Mv_user;
import three.team.movie.service.FileService;
import three.team.movie.service.MailAuthService;
import three.team.movie.service.Mv_genreService;
import three.team.movie.service.Mv_userService;
import three.team.movie.service.NaverService;
import three.team.movie.service.User_tagService;

@Controller
@RequestMapping("user")
public class Mv_userController {
	
	@Autowired
	private MailAuthService mailAuthService;
	@Autowired
	private Mv_genreService mv_genreService;
	@Autowired
	private Mv_userService mv_userService;
	@Autowired
	private NaverService naverService;
	@Autowired
	private FileService fService;
	@Autowired
	private User_tagService tagService;

	
	@RequestMapping("jusoPopup")
	public void jusoPopup() throws Exception {}
	
	
	@ResponseBody
	@GetMapping("overlap")
	public Map<String, Object> selectOne(String userid, Model model) throws Exception {
		Map<String, Object> resultMap = mv_userService.overlap(userid);
		return resultMap;
	}
	
	@PostMapping("insert")
	public String insert(Mv_user mv_user, MultipartFile profile) throws Exception {
		mv_userService.insert(mv_user, profile);
		return "redirect:login";
	}
	
	@GetMapping("login")
	public void loginF(HttpSession session, Model model) throws Exception {
		Map<String, String> resultMap = naverService.getApiURL();
		String apiURL = resultMap.get("apiURL");
		session.setAttribute("state", resultMap.get("state"));
		model.addAttribute("apiURL", apiURL);
	}
	@GetMapping("InfoInquiry")
	public void InfoInquiry() {}
	
	@ResponseBody
	@GetMapping("findMyId")
	public Map<String, Object> findMyId(String email) throws Exception {
		Mv_user mv_user = mv_userService.findMyId(email);
		String msg = "";
		Map<String, Object> resultMap = new HashMap<>();
		if (mv_user == null) {
			//????????? ??????
			msg = "???????????? ?????? ???????????????.\n?????? ?????? ?????? ?????? ??????????????? ??????????????????.";
		}
		else {
			//?????? ??????
			mailAuthService.findMyId(email, mv_user.getUser_id());
			msg = "?????? ????????? ?????????????????????.";
		}
		resultMap.put("msg", msg);
		System.out.println("?????? : " + resultMap);
		return resultMap;
	}
	@ResponseBody
	@GetMapping("findMyPw")
	public Map<String, Object> findMyPw(String user_id) throws Exception {
		Mv_user mv_user = mv_userService.selectOne(user_id);
		String msg = "";
		int code = 0;
		Map<String, Object> resultMap = new HashMap<>();
		if (mv_user == null) {
			//????????? ??????
			code = 0;
			msg = "???????????? ?????? ???????????????.\n ????????? ?????? ??????????????? ??????????????????.";
		}
		else {
			//?????? ??????
			mailAuthService.findMyPw(mv_user.getEmail(), user_id);
			code = 1;
			msg = "?????? ????????? ?????????????????????.\n?????? ????????? ????????? ???????????? ??????????????????.";
		}
		resultMap.put("msg", msg);
		resultMap.put("code", code);
		System.out.println("?????? : " + resultMap);
		return resultMap;
	}
	

	@PostMapping("loginCheck")
	public String loginCheck(String user_id, String passwd, HttpSession session, RedirectAttributes rattr) throws Exception {
		Map<String, Object> loginResult = mv_userService.login(user_id, passwd);
		if (loginResult.get("code").equals(1)) {
			Mv_user member = mv_userService.selectOne(user_id);
			session.setAttribute("user_id", user_id);
			System.out.println("user_id:"+ user_id);
			session.setAttribute("admin", member.getAdmin());
			return "redirect:/moviedata/";
		}
		else {
			rattr.addFlashAttribute("msg", loginResult.get("msg"));
			return "redirect:login";
		}
	}
	@GetMapping("myInfo")
	public void myInfo(Model model, @RequestParam(value = "user_id") String user_id) throws Exception {
		Mv_user member = mv_userService.selectOne(user_id);
		System.out.println(member);
		List<Map<String, String>> tagList =  tagService.getUserTag(user_id);
		if (member.getAdmin().equals("1")){
			member.setAdmin("?????? ??????");
		}
		else if (member.getAdmin().equals("2")) {
			member.setAdmin("?????? ??????");
		}
		else if (member.getAdmin().equals("3")) {
			member.setAdmin("VIP");
		}
		model.addAttribute("member", member);
		model.addAttribute("tagList", tagList);
	}
	
	@GetMapping("modifyInfo")
	public void modifyInfo(String user_id, Model model, HttpSession session) {
		System.out.println(session.getAttribute("user_id"));
		Mv_user member = mv_userService.selectOne(user_id);
		List<Map<String, String>> tagList = tagService.getUserTag(user_id);
		List<Map<String, String>> genreList = mv_genreService.getGenreList();
		
		if (member.getAdmin().equals("1")){
			member.setAdmin("?????? ??????");
		}
		else if (member.getAdmin().equals("2")) {
			member.setAdmin("?????? ??????");
		}
		else if (member.getAdmin().equals("3")) {
			member.setAdmin("VIP");
		}
		model.addAttribute("member", member);
		model.addAttribute("genreList", genreList);
		model.addAttribute("tagList", tagList);
		System.out.println(session.getAttribute("user_id"));
	}
	@PostMapping("modifyInfo")
	public String modifyInfo(@RequestParam(value = "tag", required=false) List<String> newTag,
							@RequestParam Map<String, Object> param, MultipartFile profile, RedirectAttributes rattr) {
		mv_userService.update(newTag, param, profile);
		rattr.addAttribute("user_id", param.get("user_id"));
		return "redirect:myInfo";
	}
	@PostMapping("updateProfile")
	public void updateProfile() {
		
	}
	
	@GetMapping("changePw")
	public void changePw(@ModelAttribute("user_id") String user_id) {}
	
	@PostMapping("updatePw")
	public String updatePw(String user_id, Model model, String newPw, RedirectAttributes rattr) {
		mv_userService.updatePw(user_id, newPw);
		rattr.addAttribute("user_id", user_id);
		return "redirect:myInfo";
	}
	
	@ResponseBody
	@PostMapping("checkPw")
	public String checkPw(@RequestParam(value = "oldPw", required = false) String passwd, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		String code ;
		Map<String, Object> resultMap = mv_userService.login(user_id, passwd);
		if (resultMap.get("code").equals(1)) {
			//?????? ?????? -> ?????? ???????????? ??????
			code = "1";
		}
		else {
			//?????? ?????????
			code = "0";
		}
		return code;
	}
	@GetMapping("modifyPw") 
	public void modifyPw(HttpSession session, Model model) {
		String user_id = (String) session.getAttribute("user_id");
		model.addAttribute("user_id", user_id);
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/moviedata/";
	}
	
	//??????
	@GetMapping("withdraw")
	public String withdraw(String user_id, HttpSession session, RedirectAttributes rattr) {
		mv_userService.delete(user_id);
		session.invalidate();
		String msg = "????????? ?????????????????? ??????????????????.";
		rattr.addFlashAttribute("msg", msg);
		return "redirect:/moviedata/";
	}
	
	@GetMapping("saleslist")
	public void getsaleslist(HttpSession session, Model model) {
		String user_id = (String) session.getAttribute("user_id");
		List<Map<String, Object>> saleslist = mv_userService.getsaleslist(user_id);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String now = sdf.format(new Date());
		model.addAttribute("now", now);
		model.addAttribute("saleslist", saleslist);
	}
	
	@GetMapping("salcancel")
	public String salcancel(int sal_num, Model model) {
		
		mv_userService.sal_delete(sal_num);
		
		String  msg = "????????? ?????????????????????.";
		model.addAttribute("msg", msg);
		
		return "redirect:saleslist";
	}
	
	
}
