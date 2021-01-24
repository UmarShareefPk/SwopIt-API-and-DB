using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Albertomoll.DataAccess
{
    public class DACommon
    {
        public static DataSet ExecuteDataset(string procname, SortedList<string, object> parms)
        {
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = procname;
            cmd.CommandTimeout = 10000;
            cmd.CommandType = CommandType.StoredProcedure;
            if (parms != null)
                foreach (string k in parms.Keys)
                    cmd.Parameters.AddWithValue(k, parms[k]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            //  try
            //  {
            da.Fill(ds);
            // }
            // catch (Exception ex)
            // {
            //     
            // }
            // finally
            // {
            con.Dispose();
            // }
            return ds;
        }
    }
}