package kosmo.team.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosmo.team.project.dao.AdminDAO;
import kosmo.team.project.dto.MemberDTO;

@Service
public class AdminServiceImplements implements AdminService {

    @Autowired
    private AdminDAO adminDAO;

    @Override
    public List<MemberDTO> getAllMembers() {
        return adminDAO.getAllMembers();
    }
}
