package by.bsuir.wtlab3.web;

import by.bsuir.wtlab3.core.dao.AuthDao;
import by.bsuir.wtlab3.core.entities.User;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Objects;

@Controller
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    private AuthDao authDao;

    @GetMapping("/login")
    public String getLoginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String doLogin(@RequestParam String email, @RequestParam String password, HttpSession session, Model model) {
        try {
            User user = authDao.loginUser(email, password);
            session.setAttribute("user", user);
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "login";
        }
        return "redirect:/films";
    }

    @GetMapping("/signup")
    public String getSignupPage() {
        return "registration";
    }

    @PostMapping("/signup")
    public String doRegistration(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String re_password,
            Model model
    ) {
        if (!Objects.equals(password, re_password)) {
            model.addAttribute("error", "Passwords should match");
            return "registration";
        }
        if (password.length() < 8) {
            model.addAttribute("error", "Password should be at least 8 characters");
            return "registration";
        }

        String salt = BCrypt.gensalt(12);
        try {
            authDao.registerUser(name, email, BCrypt.hashpw(password, salt));
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "registration";
        }
        model.addAttribute("message", "Successfully registered, you can login now");
        return "registration";
    }

    @PostMapping("/logout")
    public String doLogout(HttpSession session) {
        session.invalidate();
        return "login";
    }
}
