package niit.hospitalsys.dao;

import java.util.List;

import niit.hospitalsys.entity.Checkfactresult;
import niit.hospitalsys.entity.User;

public interface CheckFactResaultDao {
  List<Checkfactresult> findByHid(int hid);
  void save(Checkfactresult checkfactresult);
}
