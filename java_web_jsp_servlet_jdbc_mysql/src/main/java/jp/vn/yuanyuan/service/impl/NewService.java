package jp.vn.yuanyuan.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import jp.vn.yuanyuan.dao.ICategoryDAO;
import jp.vn.yuanyuan.dao.INewDAO;
import jp.vn.yuanyuan.model.CategoryModel;
import jp.vn.yuanyuan.model.NewModel;
import jp.vn.yuanyuan.paging.Pageble;
import jp.vn.yuanyuan.service.INewService;

public class NewService implements INewService {

	
	@Inject
	private INewDAO newDao;
	
	@Inject
	private ICategoryDAO categoryDAO;
	
	@Override
	public List<NewModel> findByCategoryId(Long categoryId){
		return newDao.findByCategoryId(categoryId);
	}
	
	@Override
	public NewModel save(NewModel newModel) {
		newModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		CategoryModel category = categoryDAO.findOneByCode(newModel.getCategoryCode());
		newModel.setCategoryId(category.getId());
		Long newId = newDao.save(newModel);
		return newDao.findOne(newId);
	}

	@Override
	public NewModel update(NewModel updateNew) {
		NewModel oldNew = newDao.findOne(updateNew.getId());
		updateNew.setCreatedDate(oldNew.getCreatedDate());
		updateNew.setCreatedby(oldNew.getCreatedby());
		updateNew.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		CategoryModel category = categoryDAO.findOneByCode(updateNew.getCategoryCode());
		updateNew.setCategoryId(category.getId());
		newDao.update(updateNew);
		return newDao.findOne(updateNew.getId());
	}

	@Override
	public void delete(long[] ids) {
		for(long id : ids) {
			newDao.delete(id);
		}
	}


	@Override
	public int getTotalItem() {
		return newDao.getTotalItem();
	}

	@Override
	public List<NewModel> findAll(Pageble pageble) {
		return newDao.findAll(pageble);
	}
	
	@Override
	public NewModel findOne(long id) {
		NewModel newModel = newDao.findOne(id);
		CategoryModel categoryModel = categoryDAO.findOne(newModel.getCategoryId());
		newModel.setCategoryCode(categoryModel.getCode());
		return newModel;
		
	}

	@Override
	public float getCategoryRate(NewModel model) {
		return newDao.getCategoryRate(model);
	}

}
