using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BTL.KetNoiSQL
{
    public class clsComment
    {
        public void Insert(int userId, int watchID, DateTime date, string content, int idCommentReplid)
        {
            SqlCommand sqlCom;
            if(idCommentReplid==-1)
                sqlCom = new SqlCommand("insert into comments values(@userid,@watchid,@date,@content,1,null)");
            else
                sqlCom = new SqlCommand("insert into comments values(@userid,@watchid,@date,@content,1,@idCommentReplied)");
            sqlCom.CommandType = CommandType.Text;
            sqlCom.Parameters.AddWithValue("@userid", userId);
            sqlCom.Parameters.AddWithValue("@watchid", watchID);
            sqlCom.Parameters.AddWithValue("@date", date);
            sqlCom.Parameters.AddWithValue("@content", content);
            sqlCom.Parameters.AddWithValue("@idCommentReplied", idCommentReplid);
            connectSQL.ExecuteNoneQuery(sqlCom);
        }
        public DataTable getCommentsByWatchID(int id)
        {
            string query = @"select * from comments,users where userID=userID_pk and chiTietDHid_pk="+id;
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.Text;
            return connectSQL.GetData(cmd);

        }
    }
}