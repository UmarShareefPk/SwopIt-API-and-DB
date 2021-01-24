using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Device.Location;
using System.Web.Configuration;
using log4net;
using System.Data;
using Albertomoll.DataAccess;

namespace Albertomoll
{
    public class Common
    {
              
        public static DataTable GetUserById(string UserId)
        {
            var parameters = new SortedList<string, object>()
                {
                   { "UserId" , UserId}
                };
            var User = DACommon.ExecuteDataset("GetUserById", parameters);

            return User.Tables[0];
        }

        public static DataTable GetItemById(string ItemId)
        {
            var parameters = new SortedList<string, object>()
                {
                   { "ItemId" , ItemId}
                };
            var Item = DACommon.ExecuteDataset("GetItemById", parameters);

            return Item.Tables[0];
        }

        public static string GetCoinsByUserId(string UserId)
        {
            string coins = "";
            try {
                var parameters = new SortedList<string, object>()
                {
                   { "UserId" , UserId}
                };
                coins = DACommon.ExecuteDataset("GetUserAccount", parameters).Tables[0].Rows[0]["Coins"].ToString();
            }
            catch(Exception ex) {
                coins = "";
            }

            return coins;
        }

        public static bool ValidateUser(string username)
        {
            return true;
        }

        public static bool SendEmail()
        {
            return false;
        }

        public static string GetBaseUrl()
        {

            //var url = System.ServiceModel.Web.WebOperationContext.Current.IncomingRequest.UriTemplateMatch.RequestUri.OriginalString;

            var url = System.ServiceModel.Web.WebOperationContext.Current.IncomingRequest.UriTemplateMatch.BaseUri.ToString();
            if(url.Contains("/"))
            {
                url = url.Split('/')[0];
            }
            return url;
        }

        public static string MakeProfilePicURL(string UserId, string picturePath)
        {
            if (picturePath == null || picturePath == "")
                return "";

            string url = WebConfigurationManager.AppSettings["ProfileUrl"];
            url = url + UserId + ".png";
            return url;
        }

        public static string GetImageURL(string ItemId, string ImageNumber)
        {
            string url = WebConfigurationManager.AppSettings["ItemUrl"];
            url = url + ItemId + "/" + ImageNumber + ".png";
            return url;
        }

        public static void LogException(Exception ex, string ClassName)
        {            
            ILog log = LogManager.GetLogger(ClassName);
             try
                {                  
                   log.Error("****************** Exception Block ******************\n"                     
                        + "\nException Object: \n" + ex + "\n***************** End Exception Block ****************");

                }
                catch (Exception exxxx)
                {  
                }  
        }

            
        public static double Distance(double sLatitude, double sLongitude, double dLatitude, double dLongitude, char unit='m')
        {
            
            var sCoord = new GeoCoordinate(sLatitude, sLongitude);
            var dCoord = new GeoCoordinate(dLatitude, dLongitude);

            if(unit == 'm')
                 return sCoord.GetDistanceTo(dCoord);
            else if(unit == 'k')
                return (sCoord.GetDistanceTo(dCoord))/1000;
            else
                return sCoord.GetDistanceTo(dCoord);
        } 
    }
}