package demo.controller;

import demo.model.Client;
import demo.model.Employee;
import demo.serviceImpl.ClientServiceImpl;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping
public class LoginClientController {

    @Autowired
    private ClientServiceImpl clientServiceImpl;

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String getIndex(ModelMap model) {
        Client client = new Client();
        model.addAttribute("client", client);
        return "loginClient";
    }

    @RequestMapping(value = {"/logout"}, method = RequestMethod.GET)
    public String logout(Model model,
            HttpSession session) {
        Employee employee = (Employee) session.getAttribute("loggedEmployee");
        if (employee != null) {
            System.out.println("YES");
            session.removeAttribute("loggedEmployee");

            return "redirect:/employ/login";
        }
        session.invalidate(); // Xóa toàn b? phiên làm vi?c c?a ng??i dùng
        return "redirect:/login"; // Chuy?n h??ng ??n trang ??ng nh?p sau khi ??ng xu?t
    }

    @RequestMapping(value = "/post-login", method = RequestMethod.POST)
    public String doLogin(@ModelAttribute("client") Client client,
            Model model,
            RedirectAttributes redirectAttributes,
            HttpSession session) {
        Client loggedInClient = clientServiceImpl.checkClientExist(client);
        if (loggedInClient == null) {
            model.addAttribute("error", "Invalid username or password");
            return "loginClient";
        } else {
            session.setAttribute("loggedClient", loggedInClient);
        }
        redirectAttributes.addFlashAttribute("client", loggedInClient);
        return "redirect:/user";
    }

    @RequestMapping(value = {"/signup"}, method = RequestMethod.GET)
    public String signUp(ModelMap model) {
        Client client = new Client();
        model.addAttribute("client", client);
        return "signUp";
    }

    @RequestMapping(value = {"/post-signup"}, method = RequestMethod.POST)
    public String doSignUp(ModelMap model, @ModelAttribute("client") Client newClient) {
        System.out.println(newClient.getDob());
        newClient.setName(newClient.getName().trim());
        newClient.setPassword(newClient.getPassword().trim());
        newClient.setPhone(newClient.getPhone().trim());
        newClient.setUsername(newClient.getUsername().trim());

        if (!newClient.getPhone().matches("[0-9]+")) {
            model.addAttribute("phoneFormatError", "___");
            model.addAttribute("client", newClient);
            return "signUp";
        }
        if (clientServiceImpl.checkIfUsernameExist(newClient)) {
            model.addAttribute("usernameError", "___");
            model.addAttribute("client", newClient);
            return "signUp";
        }
        if (clientServiceImpl.checkIfPhoneExist(newClient)) {
            model.addAttribute("phoneError", "___");
            model.addAttribute("client", newClient);
            return "signUp";
        }
        String clientId = clientServiceImpl.createNewProductID();
        if (clientId.equals(null)) {
            model.addAttribute("idCreateError", "___");
            model.addAttribute("client", newClient);
            return "signUp";
        }
        newClient.setId(clientId);
        clientServiceImpl.saveClient(newClient);
        model.addAttribute("registerSuccessMsg", "____");
        model.addAttribute("client", new Client());
        return "loginClient";
    }
}
