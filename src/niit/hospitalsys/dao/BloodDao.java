package niit.hospitalsys.dao;

import java.util.List;

import niit.hospitalsys.entity.Bloodhistory;
import niit.hospitalsys.entity.Blooduser;

public interface BloodDao {
	void update(Blooduser blooduser );
	void save(Blooduser blooduser );
	void savehis(Bloodhistory bloodhistory );
    List<Bloodhistory> findAll();
    Blooduser findbyRegisteID(String id);
    
}
