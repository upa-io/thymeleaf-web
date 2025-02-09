package jeaguirre.me.demoweb;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InicioController {

    @GetMapping("/")
    public String mostrarPaginaInicio(Model model) {
        model.addAttribute("nombreUsuario", "Jesús");
        return "index";
    }
}

