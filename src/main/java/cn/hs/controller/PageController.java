package cn.hs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/pages/*")
public class PageController {
    @RequestMapping("index")
    public ModelAndView index(){
        return new ModelAndView("index");
    }
    @RequestMapping("point")
    public ModelAndView point(){
        return new ModelAndView("point");
    }
    @RequestMapping("link")
    public ModelAndView link(){
        return new ModelAndView("link");
    }
    @RequestMapping("wordCloud")
    public ModelAndView wordCloud(){
        return new ModelAndView("word_cloud");
    }
    @RequestMapping("view")
    public ModelAndView view(){
        return new ModelAndView("view");
    }

    @RequestMapping("home")
    public ModelAndView home(){
        return new ModelAndView("home");
    }

    @RequestMapping("newhome")
    public ModelAndView newhome(){ return new ModelAndView("newhome");}

    @RequestMapping("overview")
    public ModelAndView overview(){ return new ModelAndView("overview");}


    @RequestMapping("login")
    public ModelAndView login(){
        return new ModelAndView("login");
    }

    @RequestMapping("newview")
    public ModelAndView newview(){
        return new ModelAndView("newview");
    }

    @RequestMapping("register")
    public ModelAndView register(){
        return new ModelAndView("register");
    }

    @RequestMapping("register_out")
    public ModelAndView register_out(){
        return new ModelAndView("register_out");
    }

    @RequestMapping("login_out")
    public ModelAndView login_out(){
        return new ModelAndView("login_out");
    }
    @RequestMapping("register_check")
    public ModelAndView register_check(){
        return new ModelAndView("register_check");
    }
    @RequestMapping("login_check")
    public ModelAndView login_check(){
        return new ModelAndView("login_check");
    }

    @RequestMapping("loadImage")
    public ModelAndView loadImage(){
        return new ModelAndView("loadImage");
    }

    @RequestMapping("columnChart")
    public ModelAndView columnChart(){
        return new ModelAndView("columnChart");
    }

    @RequestMapping("pieChart")
    public ModelAndView pieChart(){
        return new ModelAndView("pieChart");
    }
    @RequestMapping("superIntro")
    public ModelAndView superInfo(){
        return new ModelAndView("superIntro");
    }

    @RequestMapping("destinationIntro")
    public ModelAndView destinationIntro(){
        return new ModelAndView("destinationIntro");
    }

}