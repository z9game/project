package kosmo.team.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosmo.team.project.dto.MemberDTO;
import kosmo.team.project.service.AdminService;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/adminForm.do")
    public ModelAndView adminForm() {
        ModelAndView mav = new ModelAndView();

        // 모든 member 테이블의 목록을 불러옵니다.
        List<MemberDTO> memberList = this.adminService.getAllMembers();

        // 뷰에 전달할 데이터를 설정합니다.
        mav.addObject("memberList", memberList);
        mav.setViewName("adminForm.jsp"); // 관리자 화면의 JSP 파일 경로를 설정합니다.

        return mav;
    }
}
