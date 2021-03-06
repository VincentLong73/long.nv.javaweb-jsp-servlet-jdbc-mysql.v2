package jp.vn.yuanyuan.dao.impl;

import java.util.List;

import jp.vn.yuanyuan.dao.ICommentDAO;
import jp.vn.yuanyuan.mapper.CommentMapper;
import jp.vn.yuanyuan.model.CommentModel;

public class CommentDAO extends AbstractDAO<CommentModel> implements ICommentDAO{


	@Override
	public List<CommentModel> findCommentByNewId(long newId) {
		StringBuilder sql = new StringBuilder("select * from comment");
		sql.append(" where new_id=?");
		return query(sql.toString(),new CommentMapper(),newId);
	}

	@Override
	public Long save(CommentModel commentModel) {
		StringBuilder sql =new StringBuilder("insert into comment (content,user_id,new_id,createddate)");
		sql.append(" values (?,?,?,?)");
		return insert(sql.toString(),commentModel.getContent(),commentModel.getUserId(),
				commentModel.getNewId(),commentModel.getCreatedDate());
	}
}
