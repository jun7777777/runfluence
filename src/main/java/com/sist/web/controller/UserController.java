package com.sist.web.controller;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.common.model.FileData;
import com.sist.common.util.FileUtil;
import com.sist.common.util.StringUtil;
import com.sist.web.model.Order;
import com.sist.web.model.Paging;
import com.sist.web.model.Response;
import com.sist.web.model.ShippingAddr;
import com.sist.web.model.User;
import com.sist.web.model.WishList;
import com.sist.web.service.OrderService;
import com.sist.web.service.UserService;
import com.sist.web.service.WishListService;
import com.sist.web.util.CookieUtil;
import com.sist.web.util.HttpUtil;
import com.sist.web.util.JsonUtil;

@Controller
public class UserController {
	public static Logger logger = LoggerFactory.getLogger(UserController.class);

	@Value("#{env['auth.cookie.name']}")
	private String AUTH_COOKIE_NAME;

	@Autowired
	private UserService userService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private WishListService wishListService;

	// @Autowired
	// private RedisCommands<String,String> redisCommands;

	@Autowired
	JavaMailSender mailSender;

	@Value("#{env['html.template.dir']}")
	private String HTML_TEMPLATE_DIR;

	@Value("#{env['profile.img.dir']}")
	private String PROFILE_IMG_DIR;

	@Value("#{env['x.naver.client.id']}")
	private String X_NAVER_CLIENT_ID;

	@Value("#{env['x.naver.client.secret']}")
	private String X_NAVER_CLIENT_SECRET;

	@Value("#{env['x.naverpay.chain.id']}")
	private String X_NAVERPAY_CHAIN_ID;

	@Value("#{env['tosspay.client.key']}")
	private String TOSSPAY_CLIENT_KEY;

	private static final int LIST_COUNT = 5;
	private static final int PAGE_COUNT = 5;

	@RequestMapping(value = "/user/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request, HttpServletResponse response) {
		return "/user/login";
	}

	@PostMapping("/user/loginProc")
	@ResponseBody
	public Response<Object> loginProc(HttpServletRequest request, HttpServletResponse response) {
		Response<Object> ajaxResponse = new Response<Object>();

		String userEmail = HttpUtil.get(request, "userEmail");
		String userPwd = HttpUtil.get(request, "userPwd");

		if (!StringUtil.isEmpty(userEmail) & !StringUtil.isEmpty(userPwd)) {

			User user = userService.userSelect(userEmail);

			if (user != null) {
				if (StringUtil.equals(user.getUserStatus(), "Y")) {
					if (StringUtil.equals(userPwd, user.getUserPwd())) {
						CookieUtil.addCookie(response, "/", -1, AUTH_COOKIE_NAME, CookieUtil.stringToHex(userEmail));
						ajaxResponse.setResponse(0, "로그인 성공");
					} else {
						ajaxResponse.setResponse(-1, "비밀번호가 일치하지 않습니다");
					}
				} else {
					ajaxResponse.setResponse(-99, "정지된 사용자입니다");
				}
			} else {
				ajaxResponse.setResponse(404, "아이디가 존재하지 않습니다");
			}

		} else {
			ajaxResponse.setResponse(400, "클라이언트 오류");
		}

		return ajaxResponse;
	}

	@RequestMapping(value = "/user/regForm", method = RequestMethod.GET)
	public String regForm(HttpServletRequest request, HttpServletResponse response) {
		return "/user/regForm";
	}

	@PostMapping("/user/idCheck")
	@ResponseBody
	public Map<String, Object> userEmailCheck(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> ajaxResponse = new HashMap<String, Object>();

		String userEmail = HttpUtil.get(request, "userEmail");

		if (!StringUtil.isEmpty(userEmail)) {
			if (userService.userSelect(userEmail) == null) {
				ajaxResponse.put("flag", 0);
			} else {
				ajaxResponse.put("flag", 1);
			}
		} else {
			ajaxResponse.put("flag", -1);
		}
		if (logger.isDebugEnabled()) {
			logger.debug("[UserController] userEmailChekajax response \n" + JsonUtil.toJsonPretty(ajaxResponse));
		}

		return ajaxResponse;
	}

	@PostMapping("/user/regProc")
	@ResponseBody
	Response<Object> regProc(HttpServletRequest request, HttpServletResponse response) {
		Response<Object> ajaxResponse = new Response<Object>();

		String userEmail = HttpUtil.get(request, "userEmail");
		String userPwd = HttpUtil.get(request, "userPwd");
		String userName = HttpUtil.get(request, "userName");
		String userJumin = HttpUtil.get(request, "userJumin");
		String userGender = HttpUtil.get(request, "userGender");
		String userTel = HttpUtil.get(request, "userTel");

		if (!StringUtil.isEmpty(userEmail) && !StringUtil.isEmpty(userPwd) && !StringUtil.isEmpty(userName)
				&& !StringUtil.isEmpty(userGender) && !StringUtil.isEmpty(userJumin)) {
			if (userService.userSelect(userEmail) == null) {
				User user = new User();

				user.setUserEmail(userEmail);
				user.setUserName(userName);
				user.setUserPwd(userPwd);
				user.setUserGender(userGender);
				user.setUserJumin(userJumin);
				user.setUserStatus("Y");
				user.setUserGrade("BRONZE");
				user.setUserTel(userTel);

				if (userService.userInsert(user) > 0) {
					ajaxResponse.setResponse(0, "회원가입 성공");
				} else {
					ajaxResponse.setResponse(500, "회원가입 오류");
				}

			} else {
				ajaxResponse.setResponse(100, "중복 이메일입니다");
			}
		} else {
			ajaxResponse.setResponse(400, "클라이언트 오류");
		}

		return ajaxResponse;
	}

	@GetMapping("/user/logout")
	public String logOut(HttpServletRequest request, HttpServletResponse response) {
		if (CookieUtil.getCookie(request, AUTH_COOKIE_NAME) != null) {
			CookieUtil.deleteCookie(request, response, "/", AUTH_COOKIE_NAME);
		}

		return "redirect:/";
	}

	@RequestMapping(value = "/user/myPage")
	public String myPage(HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttributes, ModelMap model) {

		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		String userEmail = HttpUtil.get(request, "userEmail", "");

		if (!StringUtil.isEmpty(userEmail)) {
			if (!StringUtil.equals(cookieUserId, userEmail)) {
				cookieUserId = userEmail;
			}
		}

		else {
			cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		}

		User user = userService.userSelect(cookieUserId);

		List<WishList> wishList = null;

		long allCnt = orderService.orderAllCount(cookieUserId);
		long progressingCnt = orderService.orderProgressingCount(cookieUserId);
		long endCnt = orderService.orderEndCount(cookieUserId);

		List<Order> myPageOrder = orderService.myPageOrder(cookieUserId);

		int totalCount = 0;

		totalCount = wishListService.wishListCount(cookieUserId);

		if (totalCount > 0) {
			wishList = wishListService.wishList(cookieUserId);
		}

		model.addAttribute("myPageOrder", myPageOrder);
		model.addAttribute("allCnt", allCnt);
		model.addAttribute("progressingCnt", progressingCnt);
		model.addAttribute("endCnt", endCnt);
		model.addAttribute("wishList", wishList);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("user", user);

		return "/user/myPage";
	}

	@RequestMapping(value = "/user/idFind", method = RequestMethod.GET)
	public String idFind(HttpServletRequest request, HttpServletResponse response) {
		return "/user/idFind";
	}

	@PostMapping("/user/idFindProc")
	@ResponseBody
	ResponseEntity<Map<String, String>> idFindProc(@RequestParam("userName") String userName,
			@RequestParam("userTel") String userTel, @RequestParam("userJumin") String userJumin) {
		Map<String, String> params = new HashMap<String, String>();

		params.put("userName", userName);
		params.put("userTel", userTel);
		params.put("userJumin", userJumin);

		String email = userService.userEmailFind(params);

		if (email != null) {
			return ResponseEntity.ok(Collections.singletonMap("email", email));
		} else {
			return ResponseEntity.status(404).body(Collections.singletonMap("msg", "이메일을 찾을 수 없습니다."));
		}
	}

	@RequestMapping(value = "/user/pwdFind", method = RequestMethod.GET)
	public String pwdFind(HttpServletRequest request, HttpServletResponse response) {
		return "/user/pwdFind";
	}

	@PostMapping("/user/pwdFindProc")
	@ResponseBody
	Response<Object> pwdFindProc(HttpServletRequest request, HttpServletResponse response) {
		Response<Object> ajaxResponse = new Response<Object>();

		String userTel = HttpUtil.get(request, "userTel");
		String userJumin = HttpUtil.get(request, "userJumin");
		String userEmail = HttpUtil.get(request, "userEmail");

		if (!StringUtil.isEmpty(userEmail) && !StringUtil.isEmpty(userTel) && !StringUtil.isEmpty(userJumin)) {
			User user = new User();

			user.setUserEmail(userEmail);
			user.setUserJumin(userJumin);
			user.setUserTel(userTel);

			String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
			String specialchars = "!@#$%^*()_+-=[]{}|;:,.?";
			StringBuilder tempcode = new StringBuilder();
			Random random = new Random();

			// 최소 1개의 알파벳 대문자
			tempcode.append(chars.charAt(random.nextInt(26)));
			// 최소 1개의 알파벳 소문자
			tempcode.append(chars.charAt(random.nextInt(26) + 26));
			// 최소 1개의 숫자
			tempcode.append(chars.charAt(random.nextInt(10) + 52));
			// 최소 1개의 특수문자
			tempcode.append(specialchars.charAt(random.nextInt(specialchars.length())));

			for (int i = 4; i < 10; i++) {
				String allchars = chars + specialchars;
				int idx = random.nextInt(allchars.length());
				tempcode.append(allchars.charAt(idx));
			}

			List<Character> characters = new ArrayList<Character>();
			for (char c : tempcode.toString().toCharArray()) {
				characters.add(c);
			}

			Collections.shuffle(characters, random);

			StringBuilder shufleTempcode = new StringBuilder();

			for (char c : characters) {
				shufleTempcode.append(c);
			}

			String userPwd = userService.userPwdFind(user);

			String tempUserPwd = shufleTempcode.toString();

			if (userPwd != null) {
				user.setUserEmail(userEmail);
				user.setUserPwd(tempUserPwd);
				userService.userPwdupdate(user);

				String userName = userService.userNameFind(user);

				String setFrom = "pth1728@naver.com";
				String title = "임시 비밀번호 생성";

				try {
					String templet = new String(
							Files.readAllBytes(
									Paths.get(HTML_TEMPLATE_DIR + FileUtil.getFileSeparator() + "mail.html")),
							StandardCharsets.UTF_8);
					templet = templet.replace("{{사용자명}}", userName).replace("{{임시비밀번호}}", tempUserPwd);

					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
					helper.setFrom(setFrom);
					helper.setTo(userEmail);
					helper.setSubject(title);
					helper.setText(templet, true);
					mailSender.send(message);
				}

				catch (Exception e) {
					ajaxResponse.setResponse(200, "이메일 전송중 오류가 발생핬습니다 다시 시도해주세요");
				}

				ajaxResponse.setResponse(0, "임시비밀번호 전송");
			} else {
				ajaxResponse.setResponse(404, "비밀번호가 없습니다. 다시 확인해주세요");
			}

		} else {
			ajaxResponse.setResponse(400, "클라이언트 오류");
		}

		return ajaxResponse;
	}

	@PostMapping("/user/orgPwdChk")
	@ResponseBody
	Response<Object> orgPwdchk(HttpServletRequest request, HttpServletResponse response) {
		Response<Object> ajaxResponse = new Response<Object>();

		String userPwd = HttpUtil.get(request, "userPwd");
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		User user = userService.userSelect(cookieUserId);

		if (userPwd != null && userPwd.equals(user.getUserPwd())) {
			ajaxResponse.setCode(0);
		} else {
			ajaxResponse.setCode(-1);
		}

		return ajaxResponse;
	}

	@RequestMapping(value = "/user/userUpdate", method = RequestMethod.GET)
	public String userUpdate(HttpServletRequest request, HttpServletResponse response, Model model) {
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		User user = userService.userSelect(cookieUserId);

		String pwd = user.getUserPwd();
		if (pwd != null && pwd.length() > 4) {
			StringBuilder stars = new StringBuilder();
			for (int i = 0; i < pwd.length() - 4; i++) {
				stars.append("*");
			}

			String maskedPwd = pwd.substring(0, 2) + stars.toString() + pwd.substring(pwd.length() - 2);

			user.setUserPwd(maskedPwd);

		}

		model.addAttribute("user", user);

		return "/user/userUpdate";
	}

	@PostMapping("/user/userPwdchange")
	@ResponseBody
	Response<Object> pwdChangeProc(HttpServletRequest request, HttpServletResponse response) {

		Response<Object> ajaxResponse = new Response<Object>();

		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		User user = userService.userSelect(cookieUserId);
		String userPwd = HttpUtil.get(request, "userPwd");

		if (userPwd != null && user != null && cookieUserId != null) {
			user.setUserPwd(userPwd);
			userService.userPwdupdate(user);
			ajaxResponse.setResponse(0, "비밀번호 수정 완료");
		} else {
			ajaxResponse.setResponse(400, "클라이언트 오류");
		}

		return ajaxResponse;
	}

	@PostMapping("/user/userNamechange")
	@ResponseBody
	Response<Object> NameChangeProc(HttpServletRequest request, HttpServletResponse response) {

		Response<Object> ajaxResponse = new Response<Object>();

		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		User user = userService.userSelect(cookieUserId);
		String userName = HttpUtil.get(request, "userName");

		if (userName != null && user != null && cookieUserId != null) {
			user.setUserName(userName);
			userService.userNameupdate(user);
			ajaxResponse.setResponse(0, "이름 수정 완료");
		} else {
			ajaxResponse.setResponse(400, "클라이언트 오류");
		}

		return ajaxResponse;
	}

	@PostMapping("/user/userTelchange")
	@ResponseBody
	Response<Object> telChangeProc(HttpServletRequest request, HttpServletResponse response) {

		Response<Object> ajaxResponse = new Response<Object>();

		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		User user = userService.userSelect(cookieUserId);
		String userTel = HttpUtil.get(request, "userTel");

		if (userTel != null && user != null && cookieUserId != null) {
			user.setUserTel(userTel);
			userService.userTelupdate(user);
			ajaxResponse.setResponse(0, "전화번호 수정 완료");

		} else {
			ajaxResponse.setResponse(400, "클라이언트 오류");
		}

		return ajaxResponse;
	}

	@RequestMapping(value = "/user/userProfile", method = RequestMethod.GET)
	public String userProfile(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		User user = userService.userSelect(cookieUserId);

		model.addAttribute("user", user);

		return "/user/userProfile";
	}

	@PostMapping("/user/userDel")
	@ResponseBody
	Response<Object> userDel(HttpServletRequest request, HttpServletResponse response) {

		Response<Object> ajaxResponse = new Response<Object>();

		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		User user = userService.userSelect(cookieUserId);
		String userPwd = HttpUtil.get(request, "userPwd");

		if (cookieUserId != null && userPwd != null) {
			if (user != null) {
				user.setUserStatus("N");
				userService.userDel(user);
				CookieUtil.deleteCookie(request, response, "/", AUTH_COOKIE_NAME);
				ajaxResponse.setResponse(0, "유저 탈퇴 완료");
			} else {
				ajaxResponse.setResponse(404, "유저가 존재하지 않습니다.");
			}

		} else {
			ajaxResponse.setResponse(400, "클라이언트 오류");
		}

		return ajaxResponse;
	}

	@PostMapping("/user/profileImgCh")
	@ResponseBody
	Response<Object> profileImgCh(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception {

		Response<Object> ajaxResponse = new Response<Object>();

		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		FileData fileData = HttpUtil.getFile(request, "profileImage", PROFILE_IMG_DIR);

		if (fileData != null && fileData.getFileSize() > 0) {

			final List<String> allowedExtensions = Arrays.asList("jpg", "jpeg", "png", "gif");
			final long maxSize = 5 * 1024 * 1024;

			if (!allowedExtensions.contains(fileData.getFileExt())) {
				ajaxResponse.setResponse(400, "지원되는 확장자를 확인해주세요");
				return ajaxResponse;
			}

			if (fileData.getFileSize() > maxSize) {
				ajaxResponse.setResponse(400, "이미지 최대 크기는 5mb입니다");
				return ajaxResponse;
			}

			if (cookieUserId != null) {
				User user = userService.userSelect(cookieUserId);

				if (user.getUserProfileImg() != null) {
					FileUtil.deleteFile(PROFILE_IMG_DIR + File.separator + user.getUserProfileImg());
				}

				user.setUserProfileImg(fileData.getFileName());

				int result = userService.userProfileImgch(user);

				if (result > 0) {
					ajaxResponse.setResponse(0, "프로필 이미지 등록 완료");
				} else {
					ajaxResponse.setResponse(-1, "이미지 등록중 오류 발생");
				}

			} else {
				ajaxResponse.setResponse(404, "로그인 후 이용해주세요");
			}

		} else {
			ajaxResponse.setResponse(400, "클라이언트 오류입니다 파일을 확인해주세요");
		}
		return ajaxResponse;
	}

	@PostMapping("/user/profileImgdel")
	@ResponseBody
	Response<Object> profileimgdel(HttpServletRequest request, HttpServletResponse response) {
		Response<Object> ajaxResponse = new Response<Object>();

		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);

		if (cookieUserId != null) {

			User user = userService.userSelect(cookieUserId);

			if (user.getUserProfileImg() != null) {

				FileUtil.deleteFile(PROFILE_IMG_DIR + File.separator + user.getUserProfileImg());

				userService.userProfileImgDel(user);

				ajaxResponse.setResponse(0, "프로필 이미지 삭제 완료");
			} else {
				ajaxResponse.setResponse(404, "이미지가 존재하지 않습니다.");
				return ajaxResponse;
			}

		} else {

			ajaxResponse.setResponse(400, "로그인 후 이용해주세요");
			return ajaxResponse;

		}

		return ajaxResponse;
	}

	@PostMapping("/user/profileInfoCh")
	@ResponseBody
	Response<Object> profileInfoCh(HttpServletRequest request, HttpServletResponse response) {
		Response<Object> ajaxResponse = new Response<Object>();

		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		User user = userService.userSelect(cookieUserId);
		String userProfileIntro = HttpUtil.get(request, "userProfileIntro");

		if (userProfileIntro != null && user != null && cookieUserId != null) {
			user.setUserProfileIntro(userProfileIntro);
			userService.userProfileIntro(user);
			ajaxResponse.setResponse(0, "프로필 소개 등록 완료");
		} else {
			ajaxResponse.setResponse(400, "클라이언트 오류입니다");
		}

		return ajaxResponse;
	}

	@RequestMapping(value = "/user/buy")
	public String buy(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "tab", required = false, defaultValue = "all") String tab, Model model) {
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);

		long allCnt = orderService.orderAllCount(cookieUserId);
		long progressingCnt = orderService.orderProgressingCount(cookieUserId);
		long endCnt = orderService.orderEndCount(cookieUserId);
		String searchValue = HttpUtil.get(request, "searchValue", "");

		if (StringUtil.equals(tab, "all")) {
			long curPage = HttpUtil.get(request, "curPage", 1L);

			List<Order> list = null;
			Order order = new Order();
			Paging paging = null;

			if (!StringUtil.isEmpty(cookieUserId)) {
				order.setUserEmail(cookieUserId);
				order.setSearchValue(searchValue);

				if (allCnt > 0) {
					paging = new Paging("/user/buy?tab=all", allCnt, LIST_COUNT, PAGE_COUNT, curPage, "curPage");
					order.setStartRow(paging.getStartRow());
					order.setEndRow(paging.getEndRow());

					list = orderService.orderAllList(order);
				}

				model.addAttribute("curPage", curPage);
				model.addAttribute("orderList", list);
				model.addAttribute("paging", paging);
			}
		}

		else if (StringUtil.equals(tab, "inProgressing")) {
			long curPage = HttpUtil.get(request, "curPage", 1L);

			List<Order> list = null;
			Order order = new Order();
			Paging paging = null;

			if (!StringUtil.isEmpty(cookieUserId)) {
				order.setUserEmail(cookieUserId);

				if (progressingCnt > 0) {
					paging = new Paging("/user/buy?tab=inProgressing", progressingCnt, LIST_COUNT, PAGE_COUNT, curPage,
							"curPage");
					order.setStartRow(paging.getStartRow());
					order.setEndRow(paging.getEndRow());

					list = orderService.orderProgressingList(order);
				}

				model.addAttribute("curPage", curPage);
				model.addAttribute("paging", paging);
				model.addAttribute("orderList", list);
			}
		}

		else if (StringUtil.equals(tab, "complete")) {
			long curPage = HttpUtil.get(request, "curPage", 1L);

			List<Order> list = null;
			Order order = new Order();
			Paging paging = null;

			if (!StringUtil.isEmpty(cookieUserId)) {
				order.setUserEmail(cookieUserId);

				if (endCnt > 0) {
					paging = new Paging("/user/buy?tab=complete", endCnt, LIST_COUNT, PAGE_COUNT, curPage, "curPage");
					order.setStartRow(paging.getStartRow());
					order.setEndRow(paging.getEndRow());

					list = orderService.orderEndList(order);
				}

				model.addAttribute("curPage", curPage);
				model.addAttribute("paging", paging);
				model.addAttribute("orderList", list);
			}
		}

		model.addAttribute("currentTab", tab);
		model.addAttribute("allCnt", allCnt);
		model.addAttribute("progressingCnt", progressingCnt);
		model.addAttribute("endCnt", endCnt);
		model.addAttribute("X_NAVER_CLIENT_ID", X_NAVER_CLIENT_ID);
		model.addAttribute("X_NAVERPAY_CHAIN_ID", X_NAVERPAY_CHAIN_ID);
		model.addAttribute("X_NAVER_CLIENT_SECRET", X_NAVER_CLIENT_SECRET);
		model.addAttribute("TOSSPAY_CLIENT_KEY", TOSSPAY_CLIENT_KEY);
		model.addAttribute("customerKey", UUID.randomUUID().toString());
		model.addAttribute("user", userService.userSelect(cookieUserId));

		return "/user/buy";
	}

	@RequestMapping(value = "/buy/detail")
	@ResponseBody
	public Response<Object> allDetail(HttpServletRequest request, HttpServletResponse response) {
		Response<Object> res = new Response<Object>();

		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		String orderId = HttpUtil.get(request, "orderId", "");

		List<Order> list = null;
		Order order = new Order();

		if (!StringUtil.isEmpty(orderId) && !StringUtil.isEmpty(cookieUserId)) {
			order.setUserEmail(cookieUserId);
			order.setOrderId(orderId);

			list = orderService.orderDetail(order);

			if (list != null) {
				res.setResponse(0, "success", list);
			}

			else {
				res.setResponse(500, "서버 오류");
			}
		}

		else {
			res.setResponse(404, "잘못된 접근입니다.");
		}

		return res;
	}

	@RequestMapping(value = "/user/addrInsert", method = RequestMethod.POST)
	@ResponseBody
	public Response<Object> addrInsert(HttpServletRequest request) {
		Response<Object> ajaxResponse = new Response<>();

		String userEmail = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		String shippingAddrLine1 = HttpUtil.get(request, "addrLine1", "");
		String shippingAddrLine2 = HttpUtil.get(request, "addrLine2", "");
		String shippingAddrZipcode = HttpUtil.get(request, "zipcode", "");
		String recipientTel = HttpUtil.get(request, "recipientTel", "");
		String recipientName = HttpUtil.get(request, "recipientName", "");
		String isDefault = HttpUtil.get(request, "isDefault", "");

		ShippingAddr shippingAddr = new ShippingAddr();
		shippingAddr.setUserEmail(userEmail);
		shippingAddr.setShippingAddrLine1(shippingAddrLine1);
		shippingAddr.setShippingAddrLine2(shippingAddrLine2);
		shippingAddr.setRecipientName(recipientName);
		shippingAddr.setRecipientTel(recipientTel);
		shippingAddr.setShippingAddrZipcode(shippingAddrZipcode);
		shippingAddr.setIsDefault(isDefault);
		shippingAddr.setShippingAddrStatus("Y");

		if (userService.userAddrInsert(shippingAddr)) {
			List<ShippingAddr> addrList = userService.userAddrList(userEmail);
			ajaxResponse.setResponse(200, "배송지 추가 완료", addrList);

		} else {
			ajaxResponse.setResponse(500, "DB 정합성 오류");
		}

		return ajaxResponse;
	}

	// 임윤한 작성
	@RequestMapping(value = "/user/addrList", method = RequestMethod.POST)
	@ResponseBody
	public Response<Object> addrList(HttpServletRequest request) {
		Response<Object> ajaxResponse = new Response<>();

		String userEmail = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		if (userService.userAddrList(userEmail) != null) {
			List<ShippingAddr> addrList = userService.userAddrList(userEmail);
			ajaxResponse.setResponse(200, "배송지 조회 완료", addrList);

		} else {
			ajaxResponse.setResponse(500, "DB 정합성 오류");
		}

		return ajaxResponse;
	}

	@RequestMapping(value = "/user/userAddrList")
	public String userAddrList(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		User user = userService.userSelect(cookieUserId);

		List<ShippingAddr> addrList = userService.userAddrList(cookieUserId);
		if (userService.userAddrList(cookieUserId) != null) {
			model.addAttribute("addrList", addrList);
		} else {
			model.addAttribute("addrList", Collections.emptyList());
		}

		model.addAttribute("user", user);
		return "/user/userAddrList";

	}

	@PostMapping("/user/addrUpdate")
	@ResponseBody
	public Response<Object> addrUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Response<Object> ajaxResponse = new Response<Object>();

		String userEmail = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		String shippingAddrLine1 = HttpUtil.get(request, "addrLine1", "");
		String shippingAddrLine2 = HttpUtil.get(request, "addrLine2", "");
		String shippingAddrZipcode = HttpUtil.get(request, "zipcode", "");
		String recipientTel = HttpUtil.get(request, "recipientTel", "");
		String recipientName = HttpUtil.get(request, "recipientName", "");
		String isDefault = HttpUtil.get(request, "isDefault", "");
		String numAddr = HttpUtil.get(request, "shippingAddrNum");

		short shippingAddrNum = 0;
		if (numAddr != null) {
			shippingAddrNum = Short.parseShort(numAddr);
		}

		if (userEmail != null && shippingAddrLine1 != null && shippingAddrLine2 != null && shippingAddrZipcode != null
				&& recipientTel != null && recipientName != null && isDefault != null) {
			ShippingAddr shippingAddr = new ShippingAddr();
			shippingAddr.setRecipientName(recipientName);
			shippingAddr.setShippingAddrLine1(shippingAddrLine1);
			shippingAddr.setShippingAddrLine2(shippingAddrLine2);
			shippingAddr.setRecipientTel(recipientTel);
			shippingAddr.setShippingAddrZipcode(shippingAddrZipcode);
			shippingAddr.setIsDefault(isDefault);
			shippingAddr.setShippingAddrNum(shippingAddrNum);
			shippingAddr.setUserEmail(userEmail);

			if (userService.userAddrupdate(shippingAddr) == 1) {
				ajaxResponse.setResponse(0, "주소 수정 완료");
			} else {
				ajaxResponse.setResponse(500, "주소 수정중 서버 오류 ");
			}
		} else {
			ajaxResponse.setResponse(400, "클라이언트 오류");
		}

		return ajaxResponse;
	}

	@PostMapping("/user/addrDelete")
	@ResponseBody
	public Response<Object> addrDel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Response<Object> ajaxResponse = new Response<Object>();

		String userEmail = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		String numAddr = HttpUtil.get(request, "shippingAddrNum");

		short shippingAddrNum = 0;

		if (userEmail != null) {

			if (numAddr != null) {
				shippingAddrNum = Short.parseShort(numAddr);
				ShippingAddr shippingAddr = new ShippingAddr();
				shippingAddr.setShippingAddrNum(shippingAddrNum);
				shippingAddr.setUserEmail(userEmail);

				int result = userService.addrSoftDel(shippingAddr);

				if (result == 1) {
					ajaxResponse.setResponse(0, "주소 삭제 완료");
				} else {
					ajaxResponse.setResponse(500, "주소 삭제 중 서버 오류");
				}

			} else {
				ajaxResponse.setResponse(404, ".주소가 존재하지 않습니다.");
			}
			
		} else {
			ajaxResponse.setResponse(400, "클라이언트 오류 발생");
		}

		return ajaxResponse;
	}
}