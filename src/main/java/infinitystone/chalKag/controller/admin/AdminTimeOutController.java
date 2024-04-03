package infinitystone.chalKag.controller.admin;

import infinitystone.chalKag.biz.member.MemberDTO;
import infinitystone.chalKag.biz.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.lang.reflect.Member;
import java.util.List;

@Controller
public class AdminTimeOutController {

  @Autowired
  private MemberService memberService;

  @RequestMapping(value = "/timeOut", method = RequestMethod.POST)
  public String timeOutPage(MemberDTO memberDTO, Model model) {
    memberDTO.setSearchCondition("timeOutList");
    model.addAttribute("timeOutList", memberService.selectAll(memberDTO));
    return "adminTimeOutList";
  }

}