using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.ServiceModel.Activation;
using Newtonsoft.Json;
using System.IO;
using System.Web.Hosting;
using Albertomoll.DataAccess;
using System.Data;
using System.Net;
using System.Net.Mail;
using Albertomoll.BI;
using System.Web.Configuration;

namespace Albertomoll
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.


    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class Service1 : IAlbertoMollWCF
    {
   
       

        public ResponseData Login(Request request)
        {
            if (request == null || request.Username == null || request.Password == null)
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            var parameters = new SortedList<string, object>()
            {               
                { "Password" , request.Password },
                { "Username" , request.Username }            
            };

            try
            {
                var UserDetails = DACommon.ExecuteDataset("Login", parameters).Tables[0].Copy();

                if(UserDetails.Rows.Count == 0)
                {
                    return new ResponseData
                    {
                        ResponseCode = (int)ResponseCodes.InvalidCredentials,
                        Response = new Error() { ErrorMessage = "Invalid Username or Password." }
                    };
                }              

                var userdetails = new UserDetailsResponse
                {
                    UserId = UserDetails.Rows[0]["Id"].ToString(),
                    Name = UserDetails.Rows[0]["Name"].ToString(),
                    Username = UserDetails.Rows[0]["Username"].ToString(),
                    Email = UserDetails.Rows[0]["Email"].ToString(),
                    Phone = UserDetails.Rows[0]["Phone"].ToString(),
                    About = UserDetails.Rows[0]["About"].ToString(),
                    MoreInfo = UserDetails.Rows[0]["MoreInfo"].ToString(),
                    Address = UserDetails.Rows[0]["Address"].ToString(),
                    Longitude = UserDetails.Rows[0]["Longitude"].ToString(),
                    Latitude = UserDetails.Rows[0]["Latitude"].ToString(),
                    Coins = Common.GetCoinsByUserId(UserDetails.Rows[0]["Id"].ToString()),
                    ProfilePicture = Common.MakeProfilePicURL(UserDetails.Rows[0]["Id"].ToString(), UserDetails.Rows[0]["PicturePath"].ToString())
                };

                ResponseData reponse = new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    Response = userdetails
                };

               return  reponse;             
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }           
        }

        public ResponseData AddUser(Request request)
        {
            if (request == null  || request.Username == null
                || request.Password == null || request.Email == null || request.Phone == null
                || request.About == null || request.MoreInfo == null || request.Address == null
                || request.Longitude == null || request.Latitude == null)
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            if (request.ProfilePicture == null)
                request.ProfilePicture = "";

            string UserId = "";

            var parameters = new SortedList<string, object>()
            {
                { "Name" , request.Name },
                { "Password" , request.Password },
                { "Username" , request.Username },
                { "Email" , request.Email },
                { "Phone" , request.Phone },
                { "About" , request.About },
                { "MoreInfo" , request.MoreInfo },
                { "PicturePath" , request.ProfilePicture },
                { "Address" , request.Address },
                { "Longitude" , request.Longitude },
                { "Latitude" , request.Latitude }                
            };

            try
            {
                var AddUser = DACommon.ExecuteDataset("ADDUSER", parameters).Tables[0].Copy();
                UserId = AddUser.Rows[0][0].ToString();

                parameters = new SortedList<string, object>()
                 {
                     { "UserId" , UserId },
                     { "Bank" , "" },
                     { "AccoutNumber" ,  "" },
                     { "Coins" , 0 },
                 };

                try
                {
                    var AddCoins = DACommon.ExecuteDataset("AddCoins", parameters);
                }
                catch (Exception eex) { }
                var UserDetails = Common.GetUserById(UserId);

                var userdetails = new UserDetailsResponse
                {
                    UserId = UserDetails.Rows[0]["Id"].ToString(),
                    Name = UserDetails.Rows[0]["Name"].ToString(),
                    Username = UserDetails.Rows[0]["Username"].ToString(),
                    Email = UserDetails.Rows[0]["Email"].ToString(),
                    Phone = UserDetails.Rows[0]["Phone"].ToString(),
                    About = UserDetails.Rows[0]["About"].ToString(),
                    MoreInfo = UserDetails.Rows[0]["MoreInfo"].ToString(),
                    Address = UserDetails.Rows[0]["Address"].ToString(),
                    Longitude = UserDetails.Rows[0]["Longitude"].ToString(),
                    Latitude = UserDetails.Rows[0]["Latitude"].ToString(),
                    ProfilePicture = Common.MakeProfilePicURL(UserDetails.Rows[0]["Id"].ToString(), UserDetails.Rows[0]["PicturePath"].ToString())
                };

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    Response = userdetails

                };
            }
            catch(Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }                  
                };
            }           
        }

        public ResponseData UserAvailable(Request request)
        {
            if (request == null || request.Username == null )
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            var parameters = new SortedList<string, object>()
            {                
                { "Username" , request.Username }
            };

            try
            {
                var UserDetails = DACommon.ExecuteDataset("UserAvailable", parameters).Tables[0].Copy();

                if (UserDetails.Rows.Count == 0)
                {
                    return new ResponseData
                    {
                        ResponseCode = (int)ResponseCodes.Success,
                        Response = new Error() { ErrorMessage = "Username is available." } 
                    };
                }

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.NoDataFound,
                    Response = new Error() { ErrorMessage = "Username is not available" }                    
                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }

        public ResponseData UploadProfilePicture(string UserId, Stream Image)
        {
            if(UserId == null || UserId == "" )
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };
            }

            try
            {
                if (Common.GetUserById(UserId).Rows.Count == 0)
                {
                    return new ResponseData
                    {
                        ResponseCode = (int)ResponseCodes.MalformedRequest,
                        Response = new Error() { ErrorMessage = "User does not exist." } 
                    };
                }

                string directory = HostingEnvironment.MapPath("~/Attachments/UserProfilePics");
                if (!Directory.Exists(directory))
                {
                    Directory.CreateDirectory(directory);
                }

                string FilePath = Path.Combine(HostingEnvironment.MapPath("~/Attachments/UserProfilePics"), UserId + ".png");
                using (var output = File.Open(FilePath, FileMode.Create))
                    Image.CopyTo(output);

                var parameters = new SortedList<string, object>()
                {
                    {"UserId" ,  UserId},
                    { "FileName" , UserId}
                };
                var UpdateProfile = DACommon.ExecuteDataset("UpdateProfilePicture", parameters);

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,  
                    Response = new Message() { MessageText = "Profile Picture uploaded successfully." }
                };
            }
            catch(Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }

        public Stream DownloadProfilePicture(string UserId)
        {

            string filepath = Path.Combine(HostingEnvironment.MapPath("~/Attachments/UserProfilePics"), UserId + ".png");

            String[] filename = filepath.Split('\\');
            WebOperationContext.Current.OutgoingResponse.ContentType = "application/octet-stream";
            if (File.Exists(filepath))
            {
                String headerInfo = "attachment; filename=" + filename[filename.Length - 1];
                WebOperationContext.Current.OutgoingResponse.Headers["Content-Disposition"] = headerInfo;
                return File.OpenRead(filepath);
            }
            else
            {
                String headerInfo = "attachment; filename=" + "2.png";
                WebOperationContext.Current.OutgoingResponse.Headers["Content-Disposition"] = headerInfo;
                string errortext = "file not found";
                byte[] byteArray = Encoding.ASCII.GetBytes(errortext);
                MemoryStream stream = new MemoryStream(byteArray);
                return stream;
            }
        }

        public Stream DownloadItemImage(string ItemId, string ImageNumber)
        {

            string filepath = Path.Combine(HostingEnvironment.MapPath("~/Attachments/Items/" + ItemId + "/"), ImageNumber + ".png");

            String[] filename = filepath.Split('\\');
            WebOperationContext.Current.OutgoingResponse.ContentType = "application/octet-stream";
            if (File.Exists(filepath))
            {
                String headerInfo = "attachment; filename=" + filename[filename.Length - 1];
                WebOperationContext.Current.OutgoingResponse.Headers["Content-Disposition"] = headerInfo;
                return File.OpenRead(filepath);
            }
            else
            {
                String headerInfo = "attachment; filename=" + "2.png";
                WebOperationContext.Current.OutgoingResponse.Headers["Content-Disposition"] = headerInfo;
                string errortext = "file not found";
                byte[] byteArray = Encoding.ASCII.GetBytes(errortext);
                MemoryStream stream = new MemoryStream(byteArray);
                return stream;
            }
        }
        public ResponseData UpdateUser(Request request)
        {
            if (request == null || request.UserId == null || request.Phone == null
               || request.About == null || request.MoreInfo == null || request.Address == null
               )
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." } 
                };

            if (request.ProfilePicture == null)
                request.ProfilePicture = "";
            
            var parameters = new SortedList<string, object>()
            {
                { "UserId" , request.UserId },
                { "Name" , request.Name },
               // { "Password" , request.Password },
                //{ "Username" , request.Username },
                //{ "Email" , request.Email },
                { "Phone" , request.Phone },
                { "About" , request.About },
                { "MoreInfo" , request.MoreInfo },
                //{ "PicturePath" , request.ProfilePicture },
                { "Address" , request.Address },
                //{ "Longitude" , request.Longitude },
                //{ "Latitude" , request.Latitude }
            };

            try
            {
                if (Common.GetUserById(request.UserId).Rows.Count == 0)
                {
                    return new ResponseData
                    {
                        ResponseCode = (int)ResponseCodes.MalformedRequest,
                        Response = new Error() { ErrorMessage = "User does not exist." }                        
                    };
                }

                var UserDetails = DACommon.ExecuteDataset("UpdateUser", parameters).Tables[0].Copy();

                var userdetails = new UserDetailsResponse
                {
                    UserId = UserDetails.Rows[0]["Id"].ToString(),
                    Name = UserDetails.Rows[0]["Name"].ToString(),
                    Username = UserDetails.Rows[0]["Username"].ToString(),
                    Email = UserDetails.Rows[0]["Email"].ToString(),
                    Phone = UserDetails.Rows[0]["Phone"].ToString(),
                    About = UserDetails.Rows[0]["About"].ToString(),
                    MoreInfo = UserDetails.Rows[0]["MoreInfo"].ToString(),
                    Address = UserDetails.Rows[0]["Address"].ToString(),
                    Longitude = UserDetails.Rows[0]["Longitude"].ToString(),
                    Latitude = UserDetails.Rows[0]["Latitude"].ToString(),
                    ProfilePicture = Common.MakeProfilePicURL(UserDetails.Rows[0]["Id"].ToString(), UserDetails.Rows[0]["PicturePath"].ToString())
                };

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    Response = userdetails
                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }

        public string GetAllUsers(Request request)
        {
            return null;
        }

        public ResponseData AddItem(Request request)
        {
            int temp = 0;
            if (request == null || request.ItemName == null
                || request.ItemDetails == null || request.ItemCondition == null
                || request.CategoryId == null || request.UserId == null ||
                !int.TryParse(request.UserId, out temp) || !int.TryParse(request.CategoryId, out temp))
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            var parameters = new SortedList<string, object>()
            {
                 { "CategoryId" , request.CategoryId },
            };

            var category = DACommon.ExecuteDataset("CategoryExists", parameters).Tables[0].Copy();

            if(category.Rows.Count == 0)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Category does not exist." }                    
                };
            }


            string ItemId = "";

            parameters = new SortedList<string, object>()
            {
                { "UserId" , request.UserId },
                { "Details" , request.ItemDetails },
                { "CategoryId" , request.CategoryId },
                { "Condition" , request.ItemCondition },
                { "Name" , request.ItemName }               
            };

            try
            {
                var AddItem = DACommon.ExecuteDataset("AddItem", parameters).Tables[0].Copy();
                ItemId = AddItem.Rows[0][0].ToString();

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    Response = ItemId,                    
                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }

        public ResponseData GetItemsByUser(Request request)
        {
            int temp = 0;
            if (request == null  || request.UserId == null ||
                !int.TryParse(request.UserId, out temp))
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            var parameters = new SortedList<string, object>()
            {
                 { "UserId" , request.UserId },
            };

            List<ItemResponse> Items = new List<ItemResponse>();
            try
            {

                var ItemsData = DACommon.ExecuteDataset("GetItemsByUser", parameters).Tables[0].Copy();              
                
                foreach (DataRow row in ItemsData.Rows)
                {
                    List<string> urls = new List<string>();

                    string image = row["Image1"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["Id"].ToString(), "1"));
                    image = row["Image2"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["Id"].ToString(), "2"));
                    image = row["Image3"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["Id"].ToString(), "3"));
                    image = row["Image4"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["Id"].ToString(), "4"));
                    image = row["Image5"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["Id"].ToString(), "5"));

                    var UserDetails = Common.GetUserById(row["User_Id"].ToString());

                    var userdetails = new UserDetailsResponse
                    {
                        UserId = UserDetails.Rows[0]["Id"].ToString(),
                        Name = UserDetails.Rows[0]["Name"].ToString(),
                        Username = UserDetails.Rows[0]["Username"].ToString(),
                        Email = UserDetails.Rows[0]["Email"].ToString(),
                        Phone = UserDetails.Rows[0]["Phone"].ToString(),
                        About = UserDetails.Rows[0]["About"].ToString(),
                        MoreInfo = UserDetails.Rows[0]["MoreInfo"].ToString(),
                        Address = UserDetails.Rows[0]["Address"].ToString(),
                        Longitude = UserDetails.Rows[0]["Longitude"].ToString(),
                        Latitude = UserDetails.Rows[0]["Latitude"].ToString(),
                        ProfilePicture = Common.MakeProfilePicURL(UserDetails.Rows[0]["Id"].ToString(), UserDetails.Rows[0]["PicturePath"].ToString())
                    };

                    var item = new ItemResponse
                    {
                        ItemId = row["Id"].ToString(),
                        Name = row["Name"].ToString(),
                        User = userdetails,
                        PostDate = row.Field<DateTime>("PostDate").ToString("MM/dd/yyyy HH:mm:ss"),
                        Details = row["Details"].ToString(),
                        Condition = row["Condition"].ToString(),
                        Category = row["Category_Id"].ToString(),
                        Urls = urls
                    };

                    Items.Add(item);
                }

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    Response = Items
                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }

        }

        public ResponseData GetItemsByUserAndCategory(Request request)
        {
            if (request == null)
                request = new Request();
            try
            {
                var ItemsData = new DataTable();
                if (request.UserId != null)
                {
                    var user = Common.GetUserById(request.UserId);
                    if (user.Rows.Count == 0)
                        return new ResponseData
                        {
                            ResponseCode = (int)ResponseCodes.NoDataFound,
                            Response = new Error() { ErrorMessage = "User does not exist." }
                        };

                    if (request.SubCategoryId == null || request.SubCategoryId == "")
                    {
                        var parameters = new SortedList<string, object>()
                         {
                                { "UserId" , request.UserId},                               
                                { "Category" , request.Category }
                        };

                        ItemsData = DACommon.ExecuteDataset("GetItemsByUserAndMainCategory", parameters).Tables[0];
                    }
                    else
                    {
                        var parameters = new SortedList<string, object>()
                        {
                                 { "UserId" , request.UserId},                                 
                                 { "SubCategoryId" , request.SubCategoryId }
                        };

                        ItemsData = DACommon.ExecuteDataset("GetItemsByUserAndSubCategory", parameters).Tables[0];
                    }
                }

                List<ItemResponse> Items = new List<ItemResponse>();

                foreach (DataRow row in ItemsData.Rows)
                {
                    List<string> urls = new List<string>();

                    string image = row["Image1"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["ItemId"].ToString(), "1"));
                    image = row["Image2"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["ItemId"].ToString(), "2"));
                    image = row["Image3"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["ItemId"].ToString(), "3"));
                    image = row["Image4"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["ItemId"].ToString(), "4"));
                    image = row["Image5"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["ItemId"].ToString(), "5"));

                    var UserDetails = Common.GetUserById(row["UserId"].ToString());

                    var userdetails = new UserDetailsResponse
                    {
                        UserId = UserDetails.Rows[0]["Id"].ToString(),
                        Name = UserDetails.Rows[0]["Name"].ToString(),
                        Username = UserDetails.Rows[0]["Username"].ToString(),
                        Email = UserDetails.Rows[0]["Email"].ToString(),
                        Phone = UserDetails.Rows[0]["Phone"].ToString(),
                        About = UserDetails.Rows[0]["About"].ToString(),
                        MoreInfo = UserDetails.Rows[0]["MoreInfo"].ToString(),
                        Address = UserDetails.Rows[0]["Address"].ToString(),
                        Longitude = UserDetails.Rows[0]["Longitude"].ToString(),
                        Latitude = UserDetails.Rows[0]["Latitude"].ToString(),
                        ProfilePicture = Common.MakeProfilePicURL(UserDetails.Rows[0]["Id"].ToString(), UserDetails.Rows[0]["PicturePath"].ToString())
                    };

                    var item = new ItemResponse
                    {
                        ItemId = row["ItemId"].ToString(),
                        Name = row["ItemName"].ToString(),
                        User = userdetails,
                        PostDate = row.Field<DateTime>("ItemPostDate").ToString("MM/dd/yyyy HH:mm:ss"),
                        Details = row["ItemDetails"].ToString(),
                        Condition = row["ItemCondition"].ToString(),
                        //Category = row["Category_Id"].ToString(),
                        Urls = urls
                    };

                    Items.Add(item);
                }

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    Response = Items
                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }
        public ResponseData UploadItemImage(string ItemId, string ImageNumber , Stream Image)
        {
            int temp = 0;
            if (ItemId == null || ItemId == "" || ImageNumber == null ||
                ImageNumber == "" || !int.TryParse(ItemId, out temp) || !int.TryParse(ImageNumber, out temp))
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };
            }

            try
            {
                if(Common.GetItemById(ItemId).Rows.Count == 0)
                {
                    return new ResponseData
                    {
                        ResponseCode = (int)ResponseCodes.MalformedRequest,
                        Response = new Error() { ErrorMessage = "Item does not exist." },                        
                    };
                }
                string directory = HostingEnvironment.MapPath("~/Attachments/Items/" + ItemId + "");
                if (!Directory.Exists(directory))
                {
                    Directory.CreateDirectory(directory);
                }
                string FilePath = Path.Combine(HostingEnvironment.MapPath("~/Attachments/Items/"+ ItemId +"/"), ImageNumber + ".png");
                               

                using (var output = File.Open(FilePath, FileMode.Create))
                    Image.CopyTo(output);

                var parameters = new SortedList<string, object>()
                {
                    {"ItemId" ,  ItemId},
                    { "ImageNumber" , ImageNumber}
                };
                var UpdateProfile = DACommon.ExecuteDataset("UpdateItemImage", parameters);

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    Response = new Message() { MessageText = "Item image uploaded successfully." }
                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }

        public ResponseData GetUserById(Request request)
        {
            int temp = 0;
            if (request == null || request.UserId == null ||
                !int.TryParse(request.UserId, out temp))
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,                  
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            try
            {
                var UserDetails = Common.GetUserById(request.UserId);

                if (UserDetails.Rows.Count == 0)
                {
                    return new ResponseData
                    {
                        ResponseCode = (int)ResponseCodes.NoDataFound,
                        Response = new Error() { ErrorMessage = "User with this id does not exist." }
                    };
                }

                var userdetails = new UserDetailsResponse
                {
                    UserId = UserDetails.Rows[0]["Id"].ToString(),
                    Name = UserDetails.Rows[0]["Name"].ToString(),
                    Username = UserDetails.Rows[0]["Username"].ToString(),
                    Email = UserDetails.Rows[0]["Email"].ToString(),
                    Phone = UserDetails.Rows[0]["Phone"].ToString(),
                    About = UserDetails.Rows[0]["About"].ToString(),
                    MoreInfo = UserDetails.Rows[0]["MoreInfo"].ToString(),
                    Address = UserDetails.Rows[0]["Address"].ToString(),
                    Longitude = UserDetails.Rows[0]["Longitude"].ToString(),
                    Latitude = UserDetails.Rows[0]["Latitude"].ToString(),
                    Coins = Common.GetCoinsByUserId(UserDetails.Rows[0]["Id"].ToString()),
                    ProfilePicture = Common.MakeProfilePicURL(UserDetails.Rows[0]["Id"].ToString(), UserDetails.Rows[0]["PicturePath"].ToString())
                };
               
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    Response = userdetails
                    
                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }

                };
            }
        }

        public ResponseData GetItemById(Request request)
        {
            int temp = 0;
            if (request == null  || request.ItemId == null ||
                !int.TryParse(request.ItemId, out temp))
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            try
            {
                var Item = Common.GetItemById(request.ItemId);

                if (Item.Rows.Count == 0)
                {
                    return new ResponseData
                    {
                        ResponseCode = (int)ResponseCodes.NoDataFound,
                        Response = new Error() { ErrorMessage = "Item does not exist." }
                    };
                }

                List<string> urls = new List<string>();

                string image = Item.Rows[0]["Image1"].ToString();
                if (!string.IsNullOrWhiteSpace(image))
                    urls.Add(Common.GetImageURL(Item.Rows[0]["Id"].ToString(), "1"));
                image = Item.Rows[0]["Image2"].ToString();
                if (!string.IsNullOrWhiteSpace(image))
                    urls.Add(Common.GetImageURL(Item.Rows[0]["Id"].ToString(), "2"));
                image = Item.Rows[0]["Image3"].ToString();
                if (!string.IsNullOrWhiteSpace(image))
                    urls.Add(Common.GetImageURL(Item.Rows[0]["Id"].ToString(), "3"));
                image = Item.Rows[0]["Image4"].ToString();
                if (!string.IsNullOrWhiteSpace(image))
                    urls.Add(Common.GetImageURL(Item.Rows[0]["Id"].ToString(), "4"));
                image = Item.Rows[0]["Image5"].ToString();
                if (!string.IsNullOrWhiteSpace(image))
                    urls.Add(Common.GetImageURL(Item.Rows[0]["Id"].ToString(), "5"));

                var UserDetails = Common.GetUserById(Item.Rows[0]["User_Id"].ToString());

                var userdetails = new UserDetailsResponse
                {
                    UserId = UserDetails.Rows[0]["Id"].ToString(),
                    Name = UserDetails.Rows[0]["Name"].ToString(),
                    Username = UserDetails.Rows[0]["Username"].ToString(),
                    Email = UserDetails.Rows[0]["Email"].ToString(),
                    Phone = UserDetails.Rows[0]["Phone"].ToString(),
                    About = UserDetails.Rows[0]["About"].ToString(),
                    MoreInfo = UserDetails.Rows[0]["MoreInfo"].ToString(),
                    Address = UserDetails.Rows[0]["Address"].ToString(),
                    Longitude = UserDetails.Rows[0]["Longitude"].ToString(),
                    Latitude = UserDetails.Rows[0]["Latitude"].ToString(),
                    ProfilePicture = Common.MakeProfilePicURL(UserDetails.Rows[0]["Id"].ToString(), UserDetails.Rows[0]["PicturePath"].ToString())
                };

                var item = new ItemResponse
                {
                    ItemId = Item.Rows[0]["Id"].ToString(),
                    Name = Item.Rows[0]["Name"].ToString(),
                    User = userdetails,
                    PostDate = Item.Rows[0].Field<DateTime>("PostDate").ToString("MM/dd/yyyy HH:mm:ss"),
                    Details = Item.Rows[0]["Details"].ToString(),
                    Condition = Item.Rows[0]["Condition"].ToString(),
                    Category = Item.Rows[0]["Category_Id"].ToString(),
                    Urls = urls
                };

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    Response = item

                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message },

                };
            }
        }

        public ResponseData GetItemsByDistance( Request request)
        {           

            if (request == null)
                request = new Request();
            try
            {
                var ItemsData = new DataTable();

                if (request.UserId != null  && request.Distance != null)
                {
                    var user = Common.GetUserById(request.UserId);

                    if (user.Rows.Count == 0)                   
                        return new ResponseData
                        {
                            ResponseCode = (int)ResponseCodes.NoDataFound,
                            Response = new Error() { ErrorMessage = "User does not exist." }
                        };
                    
                    var parameters = new SortedList<string, object>()
                     {
                            { "UserId" , request.UserId},
                            { "Distance" , request.Distance}
                     };

                    ItemsData = DACommon.ExecuteDataset("GetItemsByDistance", parameters).Tables[0];
                }
                else if(request.Longitude !=null && request.Latitude != null && request.Distance != null)
                {
                    var parameters = new SortedList<string, object>()
                     {
                            { "Longitude" , request.Longitude},
                            { "Latitude" , request.Latitude},
                            { "Distance" , request.Distance}
                     };

                    ItemsData = DACommon.ExecuteDataset("GetItemsByDistanceAndLocation", parameters).Tables[0];
                }
                else
                {
                    var parameters = new SortedList<string, object>()
                     {                            
                     };
                    ItemsData = DACommon.ExecuteDataset("GetItemsByDistanceForGuest", parameters).Tables[0];
                }
                List<ItemsByDistanceResponse> ItemsWithUsers = new List<ItemsByDistanceResponse>();

                foreach(DataRow row in ItemsData.Rows)
                {
                    List<string> urls = new List<string>();

                    string image = row["Image1"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["ItemId"].ToString(), "1"));
                    image = row["Image2"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["ItemId"].ToString(), "2"));
                    image = row["Image3"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["ItemId"].ToString(), "3"));
                    image = row["Image4"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["ItemId"].ToString(), "4"));
                    image = row["Image5"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["ItemId"].ToString(), "5"));

                  
                    var userdetails = new UserDetailsResponse
                    {
                        UserId = row["UserId"].ToString(),
                        Name = row["Name"].ToString(),
                        Username = row["Username"].ToString(),
                        Phone = row["Phone"].ToString(),
                        Email = row["Email"].ToString(),
                        About = row["About"].ToString(),
                        Address = row["Address"].ToString(),
                        MoreInfo = row["MoreInfo"].ToString(),
                        Longitude = row["Longitude"].ToString(),
                        Latitude = row["Latitude"].ToString(),
                        ProfilePicture = Common.MakeProfilePicURL(row["UserId"].ToString(), row["PicturePath"].ToString())
                    };

                    var item = new ItemResponse()
                    {
                        ItemId = row["ItemId"].ToString(),
                        Name = row["ItemName"].ToString(),
                        User = userdetails,
                        PostDate = row.Field<DateTime>("ItemPostDate").ToString("MM/dd/yyyy HH:mm:ss"),
                        Details = row["ItemDetails"].ToString(),
                        Condition = row["ItemCondition"].ToString(),
                        Category = row["CategoryId"].ToString(),
                        Urls = urls
                    };

                    var itemByDistance = new ItemsByDistanceResponse()
                    {
                       Item = item,
                       Distance = row["Distance"].ToString()
                    };

                    ItemsWithUsers.Add(itemByDistance);
                }               

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    Response = ItemsWithUsers

                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }

                };
            }
        }

        public ResponseData GetItemsByCategory(Request request)
        {
            if (request == null)
                request = new Request();
            try
            {
                var ItemsData = new DataTable();
                if (request.UserId != null && request.Distance != null)
                {
                    var user = Common.GetUserById(request.UserId);
                    if (user.Rows.Count == 0)                    
                        return new ResponseData
                        {
                            ResponseCode = (int)ResponseCodes.NoDataFound,
                            Response = new Error() { ErrorMessage = "User does not exist." }
                        };                  

                    if (request.SubCategoryId == null || request.SubCategoryId == "")
                    {
                        var parameters = new SortedList<string, object>()
                         {
                                { "UserId" , request.UserId},
                                { "Distance" , request.Distance},
                                { "Category" , request.Category }
                        };

                        ItemsData = DACommon.ExecuteDataset("GetItemsByMainCategory", parameters).Tables[0];
                    }
                    else
                    {
                        var parameters = new SortedList<string, object>()
                        {
                                 { "UserId" , request.UserId},
                                 { "Distance" , request.Distance},
                                 { "SubCategoryId" , request.SubCategoryId }
                        };

                        ItemsData = DACommon.ExecuteDataset("GetItemsBySubCategory", parameters).Tables[0];
                    }
                }
                else if (request.Longitude != null && request.Latitude != null && request.Distance != null)
                {
                    if (request.SubCategoryId == null || request.SubCategoryId == "")
                    {
                        var parameters = new SortedList<string, object>()
                         {
                                { "Longitude" , request.Longitude},
                                { "Latitude" , request.Latitude},
                                { "Distance" , request.Distance},
                                { "Category" , request.Category }
                        };

                        ItemsData = DACommon.ExecuteDataset("GetItemsByMainCategoryAndLocation", parameters).Tables[0];
                    }
                    else
                    {
                        var parameters = new SortedList<string, object>()
                        {
                                 { "Longitude" , request.Longitude},
                                 { "Latitude" , request.Latitude},
                                 { "Distance" , request.Distance},
                                 { "SubCategoryId" , request.SubCategoryId }
                        };

                        ItemsData = DACommon.ExecuteDataset("GetItemsBySubCategoryAndLocation", parameters).Tables[0];
                    }
                }
                else
                {
                    if (request.SubCategoryId == null || request.SubCategoryId == "")
                    {
                        var parameters = new SortedList<string, object>()
                         {                                
                                { "Category" , request.Category }
                        };

                        ItemsData = DACommon.ExecuteDataset("GetItemsByMainCategoryForGuest", parameters).Tables[0];
                    }
                    else
                    {
                        var parameters = new SortedList<string, object>()
                        {                              
                                 { "SubCategoryId" , request.SubCategoryId }
                        };

                        ItemsData = DACommon.ExecuteDataset("GetItemsBySubCategoryForGuest", parameters).Tables[0];
                    }
                }


                List<ItemsByDistanceResponse> ItemsWithUsers = new List<ItemsByDistanceResponse>();

                foreach (DataRow row in ItemsData.Rows)
                {
                    List<string> urls = new List<string>();

                    string image = row["Image1"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["ItemId"].ToString(), "1"));
                    image = row["Image2"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["ItemId"].ToString(), "2"));
                    image = row["Image3"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["ItemId"].ToString(), "3"));
                    image = row["Image4"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["ItemId"].ToString(), "4"));
                    image = row["Image5"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["ItemId"].ToString(), "5"));


                    var userdetails = new UserDetailsResponse
                    {
                        UserId = row["UserId"].ToString(),
                        Name = row["Name"].ToString(),
                        Username = row["Username"].ToString(),
                        Phone = row["Phone"].ToString(),
                        Email = row["Email"].ToString(),
                        About = row["About"].ToString(),
                        Address = row["Address"].ToString(),
                        MoreInfo = row["MoreInfo"].ToString(),
                        Longitude = row["Longitude"].ToString(),
                        Latitude = row["Latitude"].ToString(),
                        ProfilePicture = Common.MakeProfilePicURL(row["UserId"].ToString(), row["PicturePath"].ToString())
                    };

                    var item = new ItemResponse()
                    {
                        ItemId = row["ItemId"].ToString(),
                        Name = row["ItemName"].ToString(),
                        User = userdetails,
                        PostDate = row.Field<DateTime>("ItemPostDate").ToString("MM/dd/yyyy HH:mm:ss"),
                        Details = row["ItemDetails"].ToString(),
                        Condition = row["ItemCondition"].ToString(),
                        Category = row["Category"].ToString(),
                        Urls = urls
                    };

                    var itemByDistance = new ItemsByDistanceResponse()
                    {
                        Item = item,
                        Distance = row["Distance"].ToString()
                    };
                    ItemsWithUsers.Add(itemByDistance);
                }

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    Response = ItemsWithUsers

                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }

                };
            }
        }
        public ResponseData GetItemsBySearch(Request request)
        {
            if (request == null || request.SearchTxt == null)               
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            try
            {
                var ItemsData = new DataTable();

                if (request.UserId != null && request.Distance != null)
                {
                    var user = Common.GetUserById(request.UserId);

                    if (user.Rows.Count == 0)
                        return new ResponseData
                        {
                            ResponseCode = (int)ResponseCodes.NoDataFound,
                            Response = new Error() { ErrorMessage = "User does not exist." }
                        };

                    var parameters = new SortedList<string, object>()
                     {
                            { "UserId" , request.UserId},
                            { "Distance" , request.Distance},
                            { "Search" , request.SearchTxt}
                     };

                    ItemsData = DACommon.ExecuteDataset("GetItemsBySearch", parameters).Tables[0];
                }
                else if (request.Longitude != null && request.Latitude != null && request.Distance != null)
                {
                    var parameters = new SortedList<string, object>()
                     {
                            { "Longitude" , request.Longitude},
                            { "Latitude" , request.Latitude},
                            { "Distance" , request.Distance},
                            { "Search" , request.SearchTxt}
                     };

                    ItemsData = DACommon.ExecuteDataset("GetItemsBySearchAndLocation", parameters).Tables[0];
                }
                else
                {
                    var parameters = new SortedList<string, object>()
                    {
                            { "Search" , request.SearchTxt}
                    };
                    ItemsData = DACommon.ExecuteDataset("GetItemsBySearchForGuest", parameters).Tables[0];
                }
                List<ItemsByDistanceResponse> ItemsWithUsers = new List<ItemsByDistanceResponse>();

                foreach (DataRow row in ItemsData.Rows)
                {
                    List<string> urls = new List<string>();

                    string image = row["Image1"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["ItemId"].ToString(), "1"));
                    image = row["Image2"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["ItemId"].ToString(), "2"));
                    image = row["Image3"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["ItemId"].ToString(), "3"));
                    image = row["Image4"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["ItemId"].ToString(), "4"));
                    image = row["Image5"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(row["ItemId"].ToString(), "5"));


                    var userdetails = new UserDetailsResponse
                    {
                        UserId = row["UserId"].ToString(),
                        Name = row["Name"].ToString(),
                        Username = row["Username"].ToString(),
                        Phone = row["Phone"].ToString(),
                        Email = row["Email"].ToString(),
                        About = row["About"].ToString(),
                        Address = row["Address"].ToString(),
                        MoreInfo = row["MoreInfo"].ToString(),
                        Longitude = row["Longitude"].ToString(),
                        Latitude = row["Latitude"].ToString(),
                        ProfilePicture = Common.MakeProfilePicURL(row["UserId"].ToString(), row["PicturePath"].ToString())
                    };

                    var item = new ItemResponse()
                    {
                        ItemId = row["ItemId"].ToString(),
                        Name = row["ItemName"].ToString(),
                        User = userdetails,
                        PostDate = row.Field<DateTime>("ItemPostDate").ToString("MM/dd/yyyy HH:mm:ss"),
                        Details = row["ItemDetails"].ToString(),
                        Condition = row["ItemCondition"].ToString(),
                        Category = row["CategoryId"].ToString(),
                        Urls = urls
                    };

                    var itemByDistance = new ItemsByDistanceResponse()
                    {
                        Item = item,
                        Distance = row["Distance"].ToString()
                    };

                    ItemsWithUsers.Add(itemByDistance);
                }

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    Response = ItemsWithUsers

                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }

                };
            }
        }
        public ResponseData GetAllCategories()
        {          

            if (!Common.ValidateUser(""))
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.InvalidCredentials,
                };
            }
            var parameters = new SortedList<string, object>() { };
            var AllCategories = DACommon.ExecuteDataset("GetCategories", parameters).Tables[0].Copy();

            List<CategoryResponse> categories = new List<CategoryResponse>();

            foreach(DataRow row in AllCategories.Rows)
            {
                var category = new CategoryResponse
                {
                    Id = row["Id"].ToString(),
                    Name = row["Name"].ToString(),
                    MainCategory = row["MainCategory"].ToString()
                };

                categories.Add(category);
            }
          
            return new ResponseData
            {
                ResponseCode = (int)ResponseCodes.Success,
                Response = categories         
            };
        }

        public ResponseData GetCategories()
        {

            if (!Common.ValidateUser(""))
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.InvalidCredentials,
                };
            }
            var parameters = new SortedList<string, object>() { };
            var AllCategories = DACommon.ExecuteDataset("GetCategories", parameters).Tables[0].Copy();

            var MainCategories = (from row in AllCategories.AsEnumerable()
                                 select row["MainCategory"].ToString()).Distinct().ToList();

            List<Category> Categories = new List<Category>();

            foreach (string mc in MainCategories)
            {
                var c = (from row in AllCategories.AsEnumerable()
                                  where row["MainCategory"].ToString() == mc
                                  select row).CopyToDataTable();

                List<SubCategory> SubCategories = new List<SubCategory>();

                foreach (DataRow row in c.Rows)
                {
                    var cat = new SubCategory
                    {
                        Id = row["Id"].ToString(),
                        Name = row["Name"].ToString(),                       
                    };

                    SubCategories.Add(cat);
                }

                Category Category = new Category();
                Category.Name = mc;
                Category.subCategory = SubCategories;
                Categories.Add(Category);
            }

            return new ResponseData
            {
                ResponseCode = (int)ResponseCodes.Success,
                Response = Categories
            };
        }

        public ResponseData AddChatMessage(Request request)
        {
            int temp = 0;
            if (request == null || request.Sender == null
                || request.Reciever == null || request.Message == null ||
                !int.TryParse(request.Sender, out temp) || !int.TryParse(request.Reciever, out temp))
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };                    
                        
           var parameters = new SortedList<string, object>()
            {
                { "Sender" , request.Sender },
                { "Reciever" , request.Reciever },
                { "Message" , request.Message }                
            };

            try
            {
                var AddMessage = DACommon.ExecuteDataset("AddMessage", parameters).Tables[0].Copy();

                var sender = Common.GetUserById(AddMessage.Rows[0]["Sender"].ToString());
                var reciever = Common.GetUserById(AddMessage.Rows[0]["Reciever"].ToString());
                var Message = new AddChatReponse()
                {
                    ChatId = AddMessage.Rows[0]["Id"].ToString(),
                    Sender = new UserDetailsResponse
                    {
                        UserId = sender.Rows[0]["Id"].ToString(),
                        Name = sender.Rows[0]["Name"].ToString(),
                        Username = sender.Rows[0]["Username"].ToString(),
                        Phone = sender.Rows[0]["Phone"].ToString(),
                        Email = sender.Rows[0]["Email"].ToString(),
                        About = sender.Rows[0]["About"].ToString(),
                        Address = sender.Rows[0]["Address"].ToString(),
                        MoreInfo = sender.Rows[0]["MoreInfo"].ToString(),
                        Longitude = sender.Rows[0]["Longitude"].ToString(),
                        Latitude = sender.Rows[0]["Latitude"].ToString(),
                        ProfilePicture = Common.MakeProfilePicURL(sender.Rows[0]["Id"].ToString(), sender.Rows[0]["PicturePath"].ToString())
                    },
                   Reciever = new UserDetailsResponse
                   {
                       UserId = reciever.Rows[0]["Id"].ToString(),
                       Name = reciever.Rows[0]["Name"].ToString(),
                       Username = reciever.Rows[0]["Username"].ToString(),
                       Phone = reciever.Rows[0]["Phone"].ToString(),
                       Email = reciever.Rows[0]["Email"].ToString(),
                       About = reciever.Rows[0]["About"].ToString(),
                       Address = reciever.Rows[0]["Address"].ToString(),
                       MoreInfo = reciever.Rows[0]["MoreInfo"].ToString(),
                       Longitude = reciever.Rows[0]["Longitude"].ToString(),
                       Latitude = reciever.Rows[0]["Latitude"].ToString(),
                       ProfilePicture = Common.MakeProfilePicURL(reciever.Rows[0]["Id"].ToString(), reciever.Rows[0]["PicturePath"].ToString())
                   },
                    Message = AddMessage.Rows[0]["Message"].ToString(),
                    Date = AddMessage.Rows[0].Field<DateTime>("Date").ToString("MM/dd/yyyy HH:mm:ss"),
                };

                SendPushNotificationMessage(Message, reciever.Rows[0]["Username"].ToString());

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    Response = Message,
                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }

        public ResponseData AddSwopRequest(Request request)
        {
            int temp = 0;
            if (request == null || request.Sender == null || request.SwopType == null
                || request.Reciever == null || request.RecieverItems == null || //request.SenderItems == null ||
                !int.TryParse(request.Sender, out temp) || !int.TryParse(request.Reciever, out temp))
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            var parameters = new SortedList<string, object>();


            if (request.SwopType.ToLower() == "single")
            {
                parameters = new SortedList<string, object>()
                {
                     { "Sender" , request.Sender },
                     { "Reciever" , request.Reciever },
                     { "SenderItems" ,  request.SenderItems },
                     { "RecieverItems" , request.RecieverItems },
                     { "SwopType" , request.SwopType },
                      { "Coins" , ""},
                 };
            }
            else if(request.SwopType.ToLower() == "ds")
            {
                parameters = new SortedList<string, object>()
                {
                     { "Sender" , request.Sender },
                     { "Reciever" , request.Reciever },
                     { "SenderItems" ,  request.SenderItems },
                     { "RecieverItems" , request.RecieverItems },
                     { "SwopType" , request.SwopType },
                      { "Coins" , "" },
                 };
            }
            else if(request.SwopType.ToLower() == "coin")
            {
                parameters = new SortedList<string, object>()
                {
                     { "Sender" , request.Sender },
                     { "Reciever" , request.Reciever },
                     { "SenderItems" , "" },
                     { "RecieverItems" , request.RecieverItems },
                     { "SwopType" , request.SwopType },
                     { "Coins" , request.Coins },
                 };
            }
            else
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };
            }        
                                                            

            try
            {
                var data = DACommon.ExecuteDataset("AddSwopRequest", parameters);
                var AddSwopRequest = data.Tables[0].Copy();
                var Users = data.Tables[1].Copy();
                var Items = data.Tables[2].Copy();

                if (AddSwopRequest.Columns.Count == 1)
                {
                    return new ResponseData
                    {
                        ResponseCode = (int)ResponseCodes.MalformedRequest,
                        Response = new Error() { ErrorMessage = AddSwopRequest.Rows[0][0].ToString() }
                    };
                }

                var sender = (from r in Users.AsEnumerable()
                              where r["Id"].ToString() == AddSwopRequest.Rows[0]["UserFrom_Id"].ToString()
                              select r).CopyToDataTable();
                var reciever = (from r in Users.AsEnumerable()
                                where r["Id"].ToString() == AddSwopRequest.Rows[0]["UserTo_Id"].ToString()
                                select r).CopyToDataTable();
                List<ItemResponse> senderItems = new List<ItemResponse>();
                List<ItemResponse> recieverItems = new List<ItemResponse>();

                string[] list;
                if (AddSwopRequest.Rows[0]["UserFromItems"].ToString().Contains(","))
                    list = AddSwopRequest.Rows[0]["UserFromItems"].ToString().Split(',');
                else
                    list = new string[] { AddSwopRequest.Rows[0]["UserFromItems"].ToString() };

                foreach (var itemId in list)
                {
                    if (itemId == null || itemId == "")
                        continue;

                    var itemData = (from r in Items.AsEnumerable()
                                    where r["Id"].ToString() == itemId.ToString()
                                    select r).CopyToDataTable();

                    List<string> urls = new List<string>();

                    string image = itemData.Rows[0]["Image1"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "1"));
                    image = itemData.Rows[0]["Image2"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "2"));
                    image = itemData.Rows[0]["Image3"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "3"));
                    image = itemData.Rows[0]["Image4"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "4"));
                    image = itemData.Rows[0]["Image5"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "5"));

                    var user = (from r in Users.AsEnumerable()
                                where r["Id"].ToString() == itemData.Rows[0]["User_Id"].ToString()
                                select r).CopyToDataTable();

                    var userdetails = new UserDetailsResponse
                    {
                        UserId = user.Rows[0]["Id"].ToString(),
                        Name = user.Rows[0]["Name"].ToString(),
                        Username = user.Rows[0]["Username"].ToString(),
                        Phone = user.Rows[0]["Phone"].ToString(),
                        Email = user.Rows[0]["Email"].ToString(),
                        About = user.Rows[0]["About"].ToString(),
                        Address = user.Rows[0]["Address"].ToString(),
                        MoreInfo = user.Rows[0]["MoreInfo"].ToString(),
                        Longitude = user.Rows[0]["Longitude"].ToString(),
                        Latitude = user.Rows[0]["Latitude"].ToString(),
                        ProfilePicture = Common.MakeProfilePicURL(user.Rows[0]["Id"].ToString(), user.Rows[0]["PicturePath"].ToString())
                    };

                    var item = new ItemResponse()
                    {
                        ItemId = itemData.Rows[0]["Id"].ToString(),
                        Name = itemData.Rows[0]["Name"].ToString(),
                        User = userdetails,
                        PostDate = itemData.Rows[0].Field<DateTime>("PostDate").ToString("MM/dd/yyyy HH:mm:ss"),
                        Details = itemData.Rows[0]["Details"].ToString(),
                        Condition = itemData.Rows[0]["Condition"].ToString(),
                        Category = itemData.Rows[0]["Category_Id"].ToString(),
                        Urls = urls
                    };

                    senderItems.Add(item);
                }

                if (AddSwopRequest.Rows[0]["UserToItems"].ToString().Contains(","))
                    list = AddSwopRequest.Rows[0]["UserToItems"].ToString().Split(',');
                else
                    list = new string[] { AddSwopRequest.Rows[0]["UserToItems"].ToString() };

                foreach (var itemId in list)
                {
                    if (itemId == null || itemId == "")
                        continue;

                    var itemData = (from r in Items.AsEnumerable()
                                    where r["Id"].ToString() == itemId.ToString()
                                    select r).CopyToDataTable();

                    List<string> urls = new List<string>();

                    string image = itemData.Rows[0]["Image1"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "1"));
                    image = itemData.Rows[0]["Image2"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "2"));
                    image = itemData.Rows[0]["Image3"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "3"));
                    image = itemData.Rows[0]["Image4"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "4"));
                    image = itemData.Rows[0]["Image5"].ToString();
                    if (!string.IsNullOrWhiteSpace(image))
                        urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "5"));

                    var user = (from r in Users.AsEnumerable()
                                where r["Id"].ToString() == itemData.Rows[0]["User_Id"].ToString()
                                select r).CopyToDataTable();

                    var userdetails = new UserDetailsResponse
                    {
                        UserId = user.Rows[0]["Id"].ToString(),
                        Name = user.Rows[0]["Name"].ToString(),
                        Username = user.Rows[0]["Username"].ToString(),
                        Phone = user.Rows[0]["Phone"].ToString(),
                        Email = user.Rows[0]["Email"].ToString(),
                        About = user.Rows[0]["About"].ToString(),
                        Address = user.Rows[0]["Address"].ToString(),
                        MoreInfo = user.Rows[0]["MoreInfo"].ToString(),
                        Longitude = user.Rows[0]["Longitude"].ToString(),
                        Latitude = user.Rows[0]["Latitude"].ToString(),
                        ProfilePicture = Common.MakeProfilePicURL(user.Rows[0]["Id"].ToString(), user.Rows[0]["PicturePath"].ToString())
                    };

                    var item = new ItemResponse()
                    {
                        ItemId = itemData.Rows[0]["Id"].ToString(),
                        Name = itemData.Rows[0]["Name"].ToString(),
                        User = userdetails,
                        PostDate = itemData.Rows[0].Field<DateTime>("PostDate").ToString("MM/dd/yyyy HH:mm:ss"),
                        Details = itemData.Rows[0]["Details"].ToString(),
                        Condition = itemData.Rows[0]["Condition"].ToString(),
                        Category = itemData.Rows[0]["Category_Id"].ToString(),
                        Urls = urls
                    };

                    recieverItems.Add(item);
                }

                var SwopRequest = new SwopRequestResponse()
                {
                    SwopRequestId = AddSwopRequest.Rows[0]["Id"].ToString(),
                    Sender = new UserDetailsResponse
                    {
                        UserId = sender.Rows[0]["Id"].ToString(),
                        Name = sender.Rows[0]["Name"].ToString(),
                        Username = sender.Rows[0]["Username"].ToString(),
                        Phone = sender.Rows[0]["Phone"].ToString(),
                        Email = sender.Rows[0]["Email"].ToString(),
                        About = sender.Rows[0]["About"].ToString(),
                        Address = sender.Rows[0]["Address"].ToString(),
                        MoreInfo = sender.Rows[0]["MoreInfo"].ToString(),
                        Longitude = sender.Rows[0]["Longitude"].ToString(),
                        Latitude = sender.Rows[0]["Latitude"].ToString(),
                        ProfilePicture = Common.MakeProfilePicURL(sender.Rows[0]["Id"].ToString(), sender.Rows[0]["PicturePath"].ToString())
                    },
                    Reciever = new UserDetailsResponse
                    {
                        UserId = reciever.Rows[0]["Id"].ToString(),
                        Name = reciever.Rows[0]["Name"].ToString(),
                        Username = reciever.Rows[0]["Username"].ToString(),
                        Phone = reciever.Rows[0]["Phone"].ToString(),
                        Email = reciever.Rows[0]["Email"].ToString(),
                        About = reciever.Rows[0]["About"].ToString(),
                        Address = reciever.Rows[0]["Address"].ToString(),
                        MoreInfo = reciever.Rows[0]["MoreInfo"].ToString(),
                        Longitude = reciever.Rows[0]["Longitude"].ToString(),
                        Latitude = reciever.Rows[0]["Latitude"].ToString(),
                        ProfilePicture = Common.MakeProfilePicURL(reciever.Rows[0]["Id"].ToString(), reciever.Rows[0]["PicturePath"].ToString())
                    },
                    //SenderItems = senderItems,
                    //RecieverItems = recieverItems,
                    Status = AddSwopRequest.Rows[0]["Status"].ToString(),
                    Coins = AddSwopRequest.Rows[0].IsNull("Coins") ? "" : AddSwopRequest.Rows[0]["Coins"].ToString(),
                    SwopType = AddSwopRequest.Rows[0].IsNull("Type") ? "" : AddSwopRequest.Rows[0]["Type"].ToString(),
                    Date = AddSwopRequest.Rows[0].Field<DateTime>("Date").ToString("MM/dd/yyyy HH:mm:ss"),
                };

                SendPushNotificationSwopRequest(SwopRequest, reciever.Rows[0]["Username"].ToString());
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    Response = SwopRequest
                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }

        public ResponseData UpdateSwopRequestStatus(Request request)
        {
           
            if (request == null || request.SwopRequestId == null
                || request.Status == null )
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            var parameters = new SortedList<string, object>()
            {
                { "Id" , request.SwopRequestId},
                { "Status" , request.Status }             
            };

            try
            {
                var UpdateSwopRequestStatus = DACommon.ExecuteDataset("UpdateSwopRequestStatus", parameters).Tables[0].Copy();

                var SwopRequest = new SwopRequestResponse()
                {
                    //SwopRequestId = UpdateSwopRequestStatus.Rows[0]["Id"].ToString(),
                    //Sender = UpdateSwopRequestStatus.Rows[0]["UserFrom_Id"].ToString(),
                    //Reciever = UpdateSwopRequestStatus.Rows[0]["UserTo_Id"].ToString(),                  
                    //SenderItems = UpdateSwopRequestStatus.Rows[0]["UserFromItems"].ToString(),
                    //RecieverItems = UpdateSwopRequestStatus.Rows[0]["UserToItems"].ToString(),
                    //Status = UpdateSwopRequestStatus.Rows[0]["Status"].ToString(),
                    //Date = UpdateSwopRequestStatus.Rows[0].Field<DateTime>("Date").ToString("MM/dd/yyyy HH:mm:ss"),
                };

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                   // Response = SwopRequest
                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }

        public ResponseData UpdateSenderItems(Request request)
        {

            if (request == null || request.SwopRequestId == null
                || request.SenderItems == null)
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            var parameters = new SortedList<string, object>()
            {
                { "Id" , request.SwopRequestId},
                { "SenderItems" , request.SenderItems }
            };

            try
            {
                var UpdateSwopRequestStatus = DACommon.ExecuteDataset("UpdateSenderItems", parameters).Tables[0].Copy();

                var SwopRequest = new SwopRequestResponse()
                {
                    //SwopRequestId = UpdateSwopRequestStatus.Rows[0]["Id"].ToString(),
                    //Sender = UpdateSwopRequestStatus.Rows[0]["UserFrom_Id"].ToString(),
                    //Reciever = UpdateSwopRequestStatus.Rows[0]["UserTo_Id"].ToString(),                  
                    //SenderItems = UpdateSwopRequestStatus.Rows[0]["UserFromItems"].ToString(),
                    //RecieverItems = UpdateSwopRequestStatus.Rows[0]["UserToItems"].ToString(),
                    //Status = UpdateSwopRequestStatus.Rows[0]["Status"].ToString(),
                    //Date = UpdateSwopRequestStatus.Rows[0].Field<DateTime>("Date").ToString("MM/dd/yyyy HH:mm:ss"),
                };

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    // Response = SwopRequest
                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }

        public ResponseData GetChatByUserId(Request request)
        {
            int temp = 0;
            if (request == null || request.UserId == null || !int.TryParse(request.UserId, out temp) )
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            var parameters = new SortedList<string, object>()
            {
                { "UserId" , request.UserId }               
            };

            try
            {
                var Chats = DACommon.ExecuteDataset("GetChatsByUser", parameters).Tables[0].Copy();

                List<string> Ids = new List<string>();

                List<UserDetailsResponse> Users = new List<UserDetailsResponse>();

                foreach(DataRow row in Chats.Rows)
                {
                    string sender = row["Sender"].ToString();
                    string reciever = row["Reciever"].ToString();
                    if (sender == request.UserId)
                    {
                        if (!Ids.Contains(reciever))
                            Ids.Add(reciever);
                    }
                    else if(reciever == request.UserId)
                    {
                        if (!Ids.Contains(sender))
                            Ids.Add(sender);
                    }
                }

                foreach (string id in Ids)
                {
                    var user = Common.GetUserById(id);
                    var userdetails = new UserDetailsResponse
                    {
                        UserId = user.Rows[0]["Id"].ToString(),
                        Name = user.Rows[0]["Name"].ToString(),
                        Username = user.Rows[0]["Username"].ToString(),
                        Phone = user.Rows[0]["Phone"].ToString(),
                        Email = user.Rows[0]["Email"].ToString(),
                        About = user.Rows[0]["About"].ToString(),
                        Address = user.Rows[0]["Address"].ToString(),
                        MoreInfo = user.Rows[0]["MoreInfo"].ToString(),
                        Longitude = user.Rows[0]["Longitude"].ToString(),
                        Latitude = user.Rows[0]["Latitude"].ToString(),
                        ProfilePicture = Common.MakeProfilePicURL(user.Rows[0]["Id"].ToString(), user.Rows[0]["PicturePath"].ToString())
                    };


                    Users.Add(userdetails);
                }

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    Response = Users
                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }

        public ResponseData GetChatByTwoUser(Request request)
        {
            int temp = 0;
            if (request == null || request.UserId == null || !int.TryParse(request.UserId, out temp)
                || request.User2Id == null || !int.TryParse(request.User2Id, out temp))
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            var parameters = new SortedList<string, object>()
            {
                { "User1Id" , request.UserId },
                { "User2Id" , request.User2Id }
            };

            try
            {
                var data = DACommon.ExecuteDataset("GetMessagesByTwoUsers", parameters);
                var Messages = data.Tables[0].Copy();
                var Users = data.Tables[1].Copy();

                List<ChatReponse> Chat = new List<ChatReponse>();

               // var user1 = Common.GetUserById()


                foreach (DataRow row in Messages.Rows)
                {
                    var sender = (from r in Users.AsEnumerable()
                                  where r["Id"].ToString() == row["Sender"].ToString()
                                  select r).CopyToDataTable();
                    var reciever = (from r in Users.AsEnumerable()
                                    where r["Id"].ToString() == row["Reciever"].ToString()
                                    select r).CopyToDataTable();

                    var Message = new ChatReponse()
                    {
                        ChatId = row["Id"].ToString(),
                        Sender = row["Sender"].ToString(),
                        Reciever = row["Reciever"].ToString(),
                        SenderProfilePic = Common.MakeProfilePicURL(sender.Rows[0]["Id"].ToString(), sender.Rows[0]["PicturePath"].ToString()),
                        RecieverProfilePic = Common.MakeProfilePicURL(reciever.Rows[0]["Id"].ToString(), reciever.Rows[0]["PicturePath"].ToString()),
                        Message = row["Message"].ToString(),
                        Date = row.Field<DateTime>("Date").ToString("MM/dd/yyyy HH:mm:ss"),
                    };

                    Chat.Add(Message);
                }

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    Response = Chat
                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }

        public ResponseData GetSwopRequestByUserId(Request request)
        {
            int temp = 0;
            if (request == null || request.UserId == null || !int.TryParse(request.UserId, out temp))
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            var parameters = new SortedList<string, object>()
            {
                { "UserId" , request.UserId }
            };

            try
            {
                var data = DACommon.ExecuteDataset("GetSwopRequestsByUserId", parameters);
                var SwopRequestsData = data.Tables[0].Copy();
                var Users = data.Tables[1].Copy();
                var Items = data.Tables[2].Copy();

                List<SwopRequestResponse> SwopRequests = new List<SwopRequestResponse>();

                foreach(DataRow row in SwopRequestsData.Rows)
                {
                    var sender = (from r in Users.AsEnumerable()
                                  where r["Id"].ToString() == row["UserFrom_Id"].ToString()
                                  select r).CopyToDataTable();
                    var reciever = (from r in Users.AsEnumerable()
                                  where r["Id"].ToString() == row["UserTo_Id"].ToString()
                                  select r).CopyToDataTable();
                    List<ItemResponse> senderItems = new List<ItemResponse>();
                    List<ItemResponse> recieverItems = new List<ItemResponse>();

                    string[] list;
                    if (row["UserFromItems"].ToString().Contains(","))
                        list = row["UserFromItems"].ToString().Split(',');
                    else
                        list = new string[] { row["UserFromItems"].ToString() };

                   foreach (var itemId in list)
                    {
                        if (itemId == null || itemId == "")
                            continue;

                        var itemData = (from r in Items.AsEnumerable()
                                    where r["Id"].ToString() == itemId.ToString()
                                    select r).CopyToDataTable();

                        List<string> urls = new List<string>();

                        string image = itemData.Rows[0]["Image1"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "1"));
                        image = itemData.Rows[0]["Image2"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "2"));
                        image = itemData.Rows[0]["Image3"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "3"));
                        image = itemData.Rows[0]["Image4"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "4"));
                        image = itemData.Rows[0]["Image5"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "5"));

                        var user = (from r in Users.AsEnumerable()
                                    where r["Id"].ToString() == itemData.Rows[0]["User_Id"].ToString()
                                    select r).CopyToDataTable();

                        var userdetails = new UserDetailsResponse
                        {
                            UserId = user.Rows[0]["Id"].ToString(),
                            Name = user.Rows[0]["Name"].ToString(),
                            Username = user.Rows[0]["Username"].ToString(),
                            Phone = user.Rows[0]["Phone"].ToString(),
                            Email = user.Rows[0]["Email"].ToString(),
                            About = user.Rows[0]["About"].ToString(),
                            Address = user.Rows[0]["Address"].ToString(),
                            MoreInfo = user.Rows[0]["MoreInfo"].ToString(),
                            Longitude = user.Rows[0]["Longitude"].ToString(),
                            Latitude = user.Rows[0]["Latitude"].ToString(),
                            ProfilePicture = Common.MakeProfilePicURL(user.Rows[0]["Id"].ToString(), user.Rows[0]["PicturePath"].ToString())
                        };

                        var item = new ItemResponse()
                        {
                            ItemId = itemData.Rows[0]["Id"].ToString(),
                            Name = itemData.Rows[0]["Name"].ToString(),
                            User = userdetails,
                            PostDate = itemData.Rows[0].Field<DateTime>("PostDate").ToString("MM/dd/yyyy HH:mm:ss"),
                            Details = itemData.Rows[0]["Details"].ToString(),
                            Condition = itemData.Rows[0]["Condition"].ToString(),
                            Category = itemData.Rows[0]["Category_Id"].ToString(),
                            Urls = urls
                        };

                        senderItems.Add(item);
                    }
             
                    if (row["UserToItems"].ToString().Contains(","))
                        list = row["UserToItems"].ToString().Split(',');
                    else
                        list = new string[] { row["UserToItems"].ToString() };

                    foreach (var itemId in list)
                    {
                        if (itemId == null || itemId == "")
                            continue;

                        var itemData = (from r in Items.AsEnumerable()
                                        where r["Id"].ToString() == itemId.ToString()
                                        select r).CopyToDataTable();

                        List<string> urls = new List<string>();

                        string image = itemData.Rows[0]["Image1"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "1"));
                        image = itemData.Rows[0]["Image2"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "2"));
                        image = itemData.Rows[0]["Image3"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "3"));
                        image = itemData.Rows[0]["Image4"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "4"));
                        image = itemData.Rows[0]["Image5"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "5"));

                        var user = (from r in Users.AsEnumerable()
                                    where r["Id"].ToString() == itemData.Rows[0]["User_Id"].ToString()
                                    select r).CopyToDataTable();

                        var userdetails = new UserDetailsResponse
                        {
                            UserId = user.Rows[0]["Id"].ToString(),
                            Name = user.Rows[0]["Name"].ToString(),
                            Username = user.Rows[0]["Username"].ToString(),
                            Phone = user.Rows[0]["Phone"].ToString(),
                            Email = user.Rows[0]["Email"].ToString(),
                            About = user.Rows[0]["About"].ToString(),
                            Address = user.Rows[0]["Address"].ToString(),
                            MoreInfo = user.Rows[0]["MoreInfo"].ToString(),
                            Longitude = user.Rows[0]["Longitude"].ToString(),
                            Latitude = user.Rows[0]["Latitude"].ToString(),
                            ProfilePicture = Common.MakeProfilePicURL(user.Rows[0]["Id"].ToString(), user.Rows[0]["PicturePath"].ToString())
                        };

                        var item = new ItemResponse()
                        {
                            ItemId = itemData.Rows[0]["Id"].ToString(),
                            Name = itemData.Rows[0]["Name"].ToString(),
                            User = userdetails,
                            PostDate = itemData.Rows[0].Field<DateTime>("PostDate").ToString("MM/dd/yyyy HH:mm:ss"),
                            Details = itemData.Rows[0]["Details"].ToString(),
                            Condition = itemData.Rows[0]["Condition"].ToString(),
                            Category = itemData.Rows[0]["Category_Id"].ToString(),
                            Urls = urls
                        };

                        recieverItems.Add(item);
                    }

                    var SwopRequest = new SwopRequestResponse()
                    {
                        SwopRequestId = row["Id"].ToString(),
                        Sender = new UserDetailsResponse
                        {
                            UserId = sender.Rows[0]["Id"].ToString(),
                            Name = sender.Rows[0]["Name"].ToString(),
                            Username = sender.Rows[0]["Username"].ToString(),
                            Phone = sender.Rows[0]["Phone"].ToString(),
                            Email = sender.Rows[0]["Email"].ToString(),
                            About = sender.Rows[0]["About"].ToString(),
                            Address = sender.Rows[0]["Address"].ToString(),
                            MoreInfo = sender.Rows[0]["MoreInfo"].ToString(),
                            Longitude = sender.Rows[0]["Longitude"].ToString(),
                            Latitude = sender.Rows[0]["Latitude"].ToString(),
                            ProfilePicture = Common.MakeProfilePicURL(sender.Rows[0]["Id"].ToString(), sender.Rows[0]["PicturePath"].ToString())
                        },
                        Reciever = new UserDetailsResponse
                        {
                            UserId = reciever.Rows[0]["Id"].ToString(),
                            Name = reciever.Rows[0]["Name"].ToString(),
                            Username = reciever.Rows[0]["Username"].ToString(),
                            Phone = reciever.Rows[0]["Phone"].ToString(),
                            Email = reciever.Rows[0]["Email"].ToString(),
                            About = reciever.Rows[0]["About"].ToString(),
                            Address = reciever.Rows[0]["Address"].ToString(),
                            MoreInfo = reciever.Rows[0]["MoreInfo"].ToString(),
                            Longitude = reciever.Rows[0]["Longitude"].ToString(),
                            Latitude = reciever.Rows[0]["Latitude"].ToString(),
                            ProfilePicture = Common.MakeProfilePicURL(reciever.Rows[0]["Id"].ToString(), reciever.Rows[0]["PicturePath"].ToString())
                        },                       
                        SenderItems = senderItems,
                        RecieverItems = recieverItems,
                        Status = row["Status"].ToString(),
                        Coins = row.IsNull("Coins")? "" :  row["Coins"].ToString(),
                        SwopType = row.IsNull("Type") ? "" : row["Type"].ToString(),
                        Date = row.Field<DateTime>("Date").ToString("MM/dd/yyyy HH:mm:ss"),
                    };

                    SwopRequests.Add(SwopRequest);
                }

               

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    Response = SwopRequests
                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }

        public ResponseData GetSwopRequestTwoUsers(Request request)
        {
            int temp = 0;
            if (request == null || request.UserId == null || !int.TryParse(request.UserId, out temp)
                || request.User2Id == null || !int.TryParse(request.User2Id, out temp))
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            var parameters = new SortedList<string, object>()
            {
                { "User1Id" , request.UserId },
                { "User2Id" , request.User2Id }
            };

            try
            {
              
                var data = DACommon.ExecuteDataset("GetSwopRequestsByTwoUsers", parameters);
                var SwopRequestsData = data.Tables[0].Copy();
                var Users = data.Tables[1].Copy();
                var Items = data.Tables[2].Copy();

                List<SwopRequestResponse> SwopRequests = new List<SwopRequestResponse>();

                foreach (DataRow row in SwopRequestsData.Rows)
                {
                    var sender = (from r in Users.AsEnumerable()
                                  where r["Id"].ToString() == row["UserFrom_Id"].ToString()
                                  select r).CopyToDataTable();
                    var reciever = (from r in Users.AsEnumerable()
                                    where r["Id"].ToString() == row["UserTo_Id"].ToString()
                                    select r).CopyToDataTable();
                    List<ItemResponse> senderItems = new List<ItemResponse>();
                    List<ItemResponse> recieverItems = new List<ItemResponse>();

                    string[] list;
                    if (row["UserFromItems"].ToString().Contains(","))
                        list = row["UserFromItems"].ToString().Split(',');
                    else
                        list = new string[] { row["UserFromItems"].ToString() };

                    foreach (var itemId in list)
                    {
                        if (itemId == null || itemId == "")
                            continue;

                        var itemData = (from r in Items.AsEnumerable()
                                        where r["Id"].ToString() == itemId.ToString()
                                        select r).CopyToDataTable();

                        List<string> urls = new List<string>();

                        string image = itemData.Rows[0]["Image1"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "1"));
                        image = itemData.Rows[0]["Image2"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "2"));
                        image = itemData.Rows[0]["Image3"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "3"));
                        image = itemData.Rows[0]["Image4"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "4"));
                        image = itemData.Rows[0]["Image5"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "5"));

                        var user = (from r in Users.AsEnumerable()
                                    where r["Id"].ToString() == itemData.Rows[0]["User_Id"].ToString()
                                    select r).CopyToDataTable();

                        var userdetails = new UserDetailsResponse
                        {
                            UserId = user.Rows[0]["Id"].ToString(),
                            Name = user.Rows[0]["Name"].ToString(),
                            Username = user.Rows[0]["Username"].ToString(),
                            Phone = user.Rows[0]["Phone"].ToString(),
                            Email = user.Rows[0]["Email"].ToString(),
                            About = user.Rows[0]["About"].ToString(),
                            Address = user.Rows[0]["Address"].ToString(),
                            MoreInfo = user.Rows[0]["MoreInfo"].ToString(),
                            Longitude = user.Rows[0]["Longitude"].ToString(),
                            Latitude = user.Rows[0]["Latitude"].ToString(),
                            ProfilePicture = Common.MakeProfilePicURL(user.Rows[0]["Id"].ToString(), user.Rows[0]["PicturePath"].ToString())
                        };

                        var item = new ItemResponse()
                        {
                            ItemId = itemData.Rows[0]["Id"].ToString(),
                            Name = itemData.Rows[0]["Name"].ToString(),
                            User = userdetails,
                            PostDate = itemData.Rows[0].Field<DateTime>("PostDate").ToString("MM/dd/yyyy HH:mm:ss"),
                            Details = itemData.Rows[0]["Details"].ToString(),
                            Condition = itemData.Rows[0]["Condition"].ToString(),
                            Category = itemData.Rows[0]["Category_Id"].ToString(),
                            Urls = urls
                        };

                        senderItems.Add(item);
                    }

                    if (row["UserToItems"].ToString().Contains(","))
                        list = row["UserToItems"].ToString().Split(',');
                    else
                        list = new string[] { row["UserToItems"].ToString() };

                    foreach (var itemId in list)
                    {
                        if (itemId == null || itemId == "")
                            continue;

                        var itemData = (from r in Items.AsEnumerable()
                                        where r["Id"].ToString() == itemId.ToString()
                                        select r).CopyToDataTable();

                        List<string> urls = new List<string>();

                        string image = itemData.Rows[0]["Image1"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "1"));
                        image = itemData.Rows[0]["Image2"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "2"));
                        image = itemData.Rows[0]["Image3"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "3"));
                        image = itemData.Rows[0]["Image4"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "4"));
                        image = itemData.Rows[0]["Image5"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "5"));

                        var user = (from r in Users.AsEnumerable()
                                    where r["Id"].ToString() == itemData.Rows[0]["User_Id"].ToString()
                                    select r).CopyToDataTable();

                        var userdetails = new UserDetailsResponse
                        {
                            UserId = user.Rows[0]["Id"].ToString(),
                            Name = user.Rows[0]["Name"].ToString(),
                            Username = user.Rows[0]["Username"].ToString(),
                            Phone = user.Rows[0]["Phone"].ToString(),
                            Email = user.Rows[0]["Email"].ToString(),
                            About = user.Rows[0]["About"].ToString(),
                            Address = user.Rows[0]["Address"].ToString(),
                            MoreInfo = user.Rows[0]["MoreInfo"].ToString(),
                            Longitude = user.Rows[0]["Longitude"].ToString(),
                            Latitude = user.Rows[0]["Latitude"].ToString(),
                            ProfilePicture = Common.MakeProfilePicURL(user.Rows[0]["Id"].ToString(), user.Rows[0]["PicturePath"].ToString())
                        };

                        var item = new ItemResponse()
                        {
                            ItemId = itemData.Rows[0]["Id"].ToString(),
                            Name = itemData.Rows[0]["Name"].ToString(),
                            User = userdetails,
                            PostDate = itemData.Rows[0].Field<DateTime>("PostDate").ToString("MM/dd/yyyy HH:mm:ss"),
                            Details = itemData.Rows[0]["Details"].ToString(),
                            Condition = itemData.Rows[0]["Condition"].ToString(),
                            Category = itemData.Rows[0]["Category_Id"].ToString(),
                            Urls = urls
                        };

                        recieverItems.Add(item);
                    }

                    var SwopRequest = new SwopRequestResponse()
                    {
                        SwopRequestId = row["Id"].ToString(),
                        Sender = new UserDetailsResponse
                        {
                            UserId = sender.Rows[0]["Id"].ToString(),
                            Name = sender.Rows[0]["Name"].ToString(),
                            Username = sender.Rows[0]["Username"].ToString(),
                            Phone = sender.Rows[0]["Phone"].ToString(),
                            Email = sender.Rows[0]["Email"].ToString(),
                            About = sender.Rows[0]["About"].ToString(),
                            Address = sender.Rows[0]["Address"].ToString(),
                            MoreInfo = sender.Rows[0]["MoreInfo"].ToString(),
                            Longitude = sender.Rows[0]["Longitude"].ToString(),
                            Latitude = sender.Rows[0]["Latitude"].ToString(),
                            ProfilePicture = Common.MakeProfilePicURL(sender.Rows[0]["Id"].ToString(), sender.Rows[0]["PicturePath"].ToString())
                        },
                        Reciever = new UserDetailsResponse
                        {
                            UserId = reciever.Rows[0]["Id"].ToString(),
                            Name = reciever.Rows[0]["Name"].ToString(),
                            Username = reciever.Rows[0]["Username"].ToString(),
                            Phone = reciever.Rows[0]["Phone"].ToString(),
                            Email = reciever.Rows[0]["Email"].ToString(),
                            About = reciever.Rows[0]["About"].ToString(),
                            Address = reciever.Rows[0]["Address"].ToString(),
                            MoreInfo = reciever.Rows[0]["MoreInfo"].ToString(),
                            Longitude = reciever.Rows[0]["Longitude"].ToString(),
                            Latitude = reciever.Rows[0]["Latitude"].ToString(),
                            ProfilePicture = Common.MakeProfilePicURL(reciever.Rows[0]["Id"].ToString(), reciever.Rows[0]["PicturePath"].ToString())
                        },
                        SenderItems = senderItems,
                        RecieverItems = recieverItems,
                        Status = row["Status"].ToString(),
                        Coins = row.IsNull("Coins") ? "" : row["Coins"].ToString(),
                        SwopType = row.IsNull("Type") ? "" : row["Type"].ToString(),
                        Date = row.Field<DateTime>("Date").ToString("MM/dd/yyyy HH:mm:ss"),
                    };

                    SwopRequests.Add(SwopRequest);
                }

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    Response = SwopRequests
                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }

        public ResponseData AddCoins(Request request)
        {
            int temp = 0;
            if (request == null || request.UserId == null
                || request.Coins == null || !int.TryParse(request.UserId, out temp))
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            var parameters = new SortedList<string, object>()
            {
                { "UserId" , request.UserId },
                { "Bank" , "" },
                { "AccoutNumber" ,  "" },
                { "Coins" , request.Coins },
            };

            try
            {
                var AddCoins = DACommon.ExecuteDataset("AddCoins", parameters);
                               

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                   
                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }

        public ResponseData UpdateCoins(Request request)
        {
            int temp = 0;
            if (request == null || request.UserId == null
                || request.Coins == null || !int.TryParse(request.UserId, out temp))
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            var parameters = new SortedList<string, object>()
            {
                { "UserId" , request.UserId },            
                { "Coins" , request.Coins },
            };

            try
            {
                var UpdateCoins = DACommon.ExecuteDataset("UpdateCoins", parameters);
                                

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    //Response = 
                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }

        public ResponseData RedeemCoins(Request request)
        {
            int temp = 0;
            if (request == null || request.Name == null
                || request.Coins == null || request.BankName == null || request.AccountNumber == null)
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            var parameters = new SortedList<string, object>()
            {
                { "Name" , request.Name},
                { "Coins" , request.Coins },
                { "BankName" ,  request.BankName },
                { "AccountNumber" , request.AccountNumber },
            };

            try
            {
                var AddRedeemCoins = DACommon.ExecuteDataset("AddRedeemCoin", parameters);

                /////////////////////////////////// Send Email /////////////////////////////////////

                try {
                    var fromAddress = new MailAddress("swopitumar@gmail.com", "Redeem Coins");
                    var toAddress = new MailAddress("swopit@panaceasolutions.com.pk", "Redeem Coins");
                    const string fromPassword = "pioneer007";
                    const string subject = "Redeem Coins Request";
                    string body = "User " + request.Name + " has requested to redeem coins. \n" +
                                        "Coins : " + request.Coins + "\n" +
                                         "Bank Name : " + request.BankName + "\n" +
                                         "Account Number : " + request.AccountNumber + "\n";

                    var smtp = new SmtpClient
                    {
                        Host = "smtp.gmail.com",
                        Port = 587,
                        EnableSsl = true,
                        DeliveryMethod = SmtpDeliveryMethod.Network,
                        UseDefaultCredentials = false,
                        Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                    };
                    using (var message = new MailMessage(fromAddress, toAddress)
                    {
                        Subject = subject,
                        Body = body
                    })
                    {
                        smtp.Send(message);
                    }
                }
                catch(Exception ex)
                {

                }
                ///////////////////////////////////////////////////////////////////////////////////

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,

                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }

        public ResponseData EvaluateSwopper(Request request)
        {
            int temp = 0;
            if (request == null || 
                request.UserId == null || !int.TryParse(request.UserId, out temp) ||
                request.Rater == null || !int.TryParse(request.Rater, out temp) ||
                request.Rating == null || !int.TryParse(request.Rating, out temp)

                )
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            var parameters = new SortedList<string, object>()
            {
                { "UserId" , request.UserId },
                { "Rater" , request.Rater },
                { "Rating" ,  request.Rating }               
            };

            try
            {
                var AddCoins = DACommon.ExecuteDataset("AddRating", parameters);


                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,

                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }

        public ResponseData GetSwoppers(Request request)
        {
            int temp = 0;
            if (request == null || request.UserId == null || request.Distance == null || !int.TryParse(request.UserId, out temp))
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            var parameters = new SortedList<string, object>()
            {
                { "UserId" , request.UserId },
                 { "Distance" , request.Distance }
            };

            try
            {
                var Swoppers = DACommon.ExecuteDataset("GetSwoppers", parameters).Tables[0].Copy();
                              
                List<UserDetailsResponse> Users = new List<UserDetailsResponse>();                              

                foreach (DataRow row in Swoppers.Rows)
                {
                                    
                    var userdetails = new UserDetailsResponse
                    {
                        UserId = row["Id"].ToString(),
                        Name = row["Name"].ToString(),
                        Username = row["Username"].ToString(),
                        Phone = row["Phone"].ToString(),
                        Email = row["Email"].ToString(),
                        About = row["About"].ToString(),
                        Address = row["Address"].ToString(),
                        MoreInfo = row["MoreInfo"].ToString(),
                        Longitude = row["Longitude"].ToString(),
                        Latitude = row["Latitude"].ToString(),
                        ProfilePicture = Common.MakeProfilePicURL(row["Id"].ToString(), row["PicturePath"].ToString())
                    };


                    Users.Add(userdetails);
                }

                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    Response = Users
                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }

        public ResponseData GetLastMessage(Request request)
        {
            int temp = 0;
            if (request == null || request.UserId == null || !int.TryParse(request.UserId, out temp)
                )
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            var parameters = new SortedList<string, object>()
            {
                { "UserId" , request.UserId }
            };

            try
            {
                var data = DACommon.ExecuteDataset("LastMessageByUser", parameters).Tables[0];                          

                ChatReponse Chat = new ChatReponse();

                if(data.Rows.Count == 0)
                {
                    return new ResponseData
                    {
                        ResponseCode = (int)ResponseCodes.NoDataFound,
                    };
                }
                                
                    var Message = new ChatReponse()
                    {
                        ChatId = data.Rows[0]["Id"].ToString(),
                        Sender = data.Rows[0]["Sender"].ToString(),
                        Reciever = data.Rows[0]["Reciever"].ToString(),
                        //SenderProfilePic = Common.MakeProfilePicURL(sender.Rows[0]["Id"].ToString(), sender.Rows[0]["PicturePath"].ToString()),
                       // RecieverProfilePic = Common.MakeProfilePicURL(reciever.Rows[0]["Id"].ToString(), reciever.Rows[0]["PicturePath"].ToString()),
                        Message = data.Rows[0]["Message"].ToString(),
                        Date = data.Rows[0].Field<DateTime>("Date").ToString("MM/dd/yyyy HH:mm:ss"),
                    };                 
                
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    Response = Message
                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }

        public ResponseData AcceptedSwopsByUser(Request request)
        {
            int temp = 0;
            if (request == null || request.UserId == null || !int.TryParse(request.UserId, out temp))
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            var parameters = new SortedList<string, object>()
            {
                { "UserId" , request.UserId }
            };

            try
            {
                var data = DACommon.ExecuteDataset("AcceptedSwopsByUser", parameters);
                var SwopRequestsData = data.Tables[0].Copy();
                var Users = data.Tables[1].Copy();
                var Items = data.Tables[2].Copy();

                List<SwopRequestResponse> SwopRequests = new List<SwopRequestResponse>();

                foreach (DataRow row in SwopRequestsData.Rows)
                {
                    var sender = (from r in Users.AsEnumerable()
                                  where r["Id"].ToString() == row["UserFrom_Id"].ToString()
                                  select r).CopyToDataTable();
                    var reciever = (from r in Users.AsEnumerable()
                                    where r["Id"].ToString() == row["UserTo_Id"].ToString()
                                    select r).CopyToDataTable();
                    List<ItemResponse> senderItems = new List<ItemResponse>();
                    List<ItemResponse> recieverItems = new List<ItemResponse>();

                    string[] list;
                    if (row["UserFromItems"].ToString().Contains(","))
                        list = row["UserFromItems"].ToString().Split(',');
                    else
                        list = new string[] { row["UserFromItems"].ToString() };

                    foreach (var itemId in list)
                    {
                        if (itemId == null || itemId == "")
                            continue;

                        var itemData = (from r in Items.AsEnumerable()
                                        where r["Id"].ToString() == itemId.ToString()
                                        select r).CopyToDataTable();

                        List<string> urls = new List<string>();

                        string image = itemData.Rows[0]["Image1"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "1"));
                        image = itemData.Rows[0]["Image2"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "2"));
                        image = itemData.Rows[0]["Image3"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "3"));
                        image = itemData.Rows[0]["Image4"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "4"));
                        image = itemData.Rows[0]["Image5"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "5"));

                        var user = (from r in Users.AsEnumerable()
                                    where r["Id"].ToString() == itemData.Rows[0]["User_Id"].ToString()
                                    select r).CopyToDataTable();

                        var userdetails = new UserDetailsResponse
                        {
                            UserId = user.Rows[0]["Id"].ToString(),
                            Name = user.Rows[0]["Name"].ToString(),
                            Username = user.Rows[0]["Username"].ToString(),
                            Phone = user.Rows[0]["Phone"].ToString(),
                            Email = user.Rows[0]["Email"].ToString(),
                            About = user.Rows[0]["About"].ToString(),
                            Address = user.Rows[0]["Address"].ToString(),
                            MoreInfo = user.Rows[0]["MoreInfo"].ToString(),
                            Longitude = user.Rows[0]["Longitude"].ToString(),
                            Latitude = user.Rows[0]["Latitude"].ToString(),
                            ProfilePicture = Common.MakeProfilePicURL(user.Rows[0]["Id"].ToString(), user.Rows[0]["PicturePath"].ToString())
                        };

                        var item = new ItemResponse()
                        {
                            ItemId = itemData.Rows[0]["Id"].ToString(),
                            Name = itemData.Rows[0]["Name"].ToString(),
                            User = userdetails,
                            PostDate = itemData.Rows[0].Field<DateTime>("PostDate").ToString("MM/dd/yyyy HH:mm:ss"),
                            Details = itemData.Rows[0]["Details"].ToString(),
                            Condition = itemData.Rows[0]["Condition"].ToString(),
                            Category = itemData.Rows[0]["Category_Id"].ToString(),
                            Urls = urls
                        };

                        senderItems.Add(item);
                    }

                    if (row["UserToItems"].ToString().Contains(","))
                        list = row["UserToItems"].ToString().Split(',');
                    else
                        list = new string[] { row["UserToItems"].ToString() };

                    foreach (var itemId in list)
                    {
                        if (itemId == null || itemId == "")
                            continue;

                        var itemData = (from r in Items.AsEnumerable()
                                        where r["Id"].ToString() == itemId.ToString()
                                        select r).CopyToDataTable();

                        List<string> urls = new List<string>();

                        string image = itemData.Rows[0]["Image1"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "1"));
                        image = itemData.Rows[0]["Image2"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "2"));
                        image = itemData.Rows[0]["Image3"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "3"));
                        image = itemData.Rows[0]["Image4"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "4"));
                        image = itemData.Rows[0]["Image5"].ToString();
                        if (!string.IsNullOrWhiteSpace(image))
                            urls.Add(Common.GetImageURL(itemData.Rows[0]["Id"].ToString(), "5"));

                        var user = (from r in Users.AsEnumerable()
                                    where r["Id"].ToString() == itemData.Rows[0]["User_Id"].ToString()
                                    select r).CopyToDataTable();

                        var userdetails = new UserDetailsResponse
                        {
                            UserId = user.Rows[0]["Id"].ToString(),
                            Name = user.Rows[0]["Name"].ToString(),
                            Username = user.Rows[0]["Username"].ToString(),
                            Phone = user.Rows[0]["Phone"].ToString(),
                            Email = user.Rows[0]["Email"].ToString(),
                            About = user.Rows[0]["About"].ToString(),
                            Address = user.Rows[0]["Address"].ToString(),
                            MoreInfo = user.Rows[0]["MoreInfo"].ToString(),
                            Longitude = user.Rows[0]["Longitude"].ToString(),
                            Latitude = user.Rows[0]["Latitude"].ToString(),
                            ProfilePicture = Common.MakeProfilePicURL(user.Rows[0]["Id"].ToString(), user.Rows[0]["PicturePath"].ToString())
                        };

                        var item = new ItemResponse()
                        {
                            ItemId = itemData.Rows[0]["Id"].ToString(),
                            Name = itemData.Rows[0]["Name"].ToString(),
                            User = userdetails,
                            PostDate = itemData.Rows[0].Field<DateTime>("PostDate").ToString("MM/dd/yyyy HH:mm:ss"),
                            Details = itemData.Rows[0]["Details"].ToString(),
                            Condition = itemData.Rows[0]["Condition"].ToString(),
                            Category = itemData.Rows[0]["Category_Id"].ToString(),
                            Urls = urls
                        };

                        recieverItems.Add(item);
                    }

                    var SwopRequest = new SwopRequestResponse()
                    {
                        SwopRequestId = row["Id"].ToString(),
                        Sender = new UserDetailsResponse
                        {
                            UserId = sender.Rows[0]["Id"].ToString(),
                            Name = sender.Rows[0]["Name"].ToString(),
                            Username = sender.Rows[0]["Username"].ToString(),
                            Phone = sender.Rows[0]["Phone"].ToString(),
                            Email = sender.Rows[0]["Email"].ToString(),
                            About = sender.Rows[0]["About"].ToString(),
                            Address = sender.Rows[0]["Address"].ToString(),
                            MoreInfo = sender.Rows[0]["MoreInfo"].ToString(),
                            Longitude = sender.Rows[0]["Longitude"].ToString(),
                            Latitude = sender.Rows[0]["Latitude"].ToString(),
                            ProfilePicture = Common.MakeProfilePicURL(sender.Rows[0]["Id"].ToString(), sender.Rows[0]["PicturePath"].ToString())
                        },
                        Reciever = new UserDetailsResponse
                        {
                            UserId = reciever.Rows[0]["Id"].ToString(),
                            Name = reciever.Rows[0]["Name"].ToString(),
                            Username = reciever.Rows[0]["Username"].ToString(),
                            Phone = reciever.Rows[0]["Phone"].ToString(),
                            Email = reciever.Rows[0]["Email"].ToString(),
                            About = reciever.Rows[0]["About"].ToString(),
                            Address = reciever.Rows[0]["Address"].ToString(),
                            MoreInfo = reciever.Rows[0]["MoreInfo"].ToString(),
                            Longitude = reciever.Rows[0]["Longitude"].ToString(),
                            Latitude = reciever.Rows[0]["Latitude"].ToString(),
                            ProfilePicture = Common.MakeProfilePicURL(reciever.Rows[0]["Id"].ToString(), reciever.Rows[0]["PicturePath"].ToString())
                        },
                        SenderItems = senderItems,
                        RecieverItems = recieverItems,
                        Status = row["Status"].ToString(),
                        Coins = row.IsNull("Coins") ? "" : row["Coins"].ToString(),
                        SwopType = row.IsNull("Type") ? "" : row["Type"].ToString(),
                        Date = row.Field<DateTime>("Date").ToString("MM/dd/yyyy HH:mm:ss"),
                    };

                    SwopRequests.Add(SwopRequest);
                }



                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,
                    Response = SwopRequests
                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }

        public ResponseData ContactUs(Request request)
        {
            int temp = 0;
            if (request == null ||
                request.UserId == null || !int.TryParse(request.UserId, out temp) ||
                request.Email == null || request.Message == null
                )
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.MalformedRequest,
                    Response = new Error() { ErrorMessage = "Some or all required fields are missing." }
                };

            var parameters = new SortedList<string, object>()
            {
                { "UserId" , request.UserId },
                { "Email" , request.Email },
                { "Message" ,  request.Message }
            };

            try
            {
                var AddCoins = DACommon.ExecuteDataset("AddContactUs", parameters);


                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.Success,

                };
            }
            catch (Exception ex)
            {
                return new ResponseData
                {
                    ResponseCode = (int)ResponseCodes.DatabaseError,
                    Response = new Error() { ErrorMessage = ex.Message }
                };
            }
        }

        public void SendPushNotificationMessage(AddChatReponse Chat , string Username)
        {

            string serverKey = "AAAAROeTFGk:APA91bFQ1Znu1dj2tQiPU6Y_a7mtahwcerMfXFRjelrtKOS200qNDK2BWwmIe1ceNgZRqT3Qv3VZ_DOhfycVhankeyflOHbHtCXTsRDFE-a37tSc-myPerk50Kv9bFQMsR-5pDL0YvOA";
            string senderId = "295942952041";
            serverKey = WebConfigurationManager.AppSettings["ServerKey"];
            senderId = WebConfigurationManager.AppSettings["SenderId"];
            try
            {
                WebRequest tRequest = WebRequest.Create("https://fcm.googleapis.com/fcm/send");
                tRequest.Method = "post";
                tRequest.ContentType = "application/json";
                var objNotification = new
                {
                    to = "/topics/" + Username,
                    data = new
                    {
                        Type = "Message",
                        Message = Chat
                    }
                };
                string jsonNotificationFormat = Newtonsoft.Json.JsonConvert.SerializeObject(objNotification);

                Byte[] byteArray = Encoding.UTF8.GetBytes(jsonNotificationFormat);
                tRequest.Headers.Add(string.Format("Authorization: key={0}", serverKey));
                tRequest.Headers.Add(string.Format("Sender: id={0}", senderId));
                tRequest.ContentLength = byteArray.Length;
                tRequest.ContentType = "application/json";
                using (Stream dataStream = tRequest.GetRequestStream())
                {
                    dataStream.Write(byteArray, 0, byteArray.Length);

                    using (WebResponse tResponse = tRequest.GetResponse())
                    {
                        using (Stream dataStreamResponse = tResponse.GetResponseStream())
                        {
                            using (StreamReader tReader = new StreamReader(dataStreamResponse))
                            {
                                String responseFromFirebaseServer = tReader.ReadToEnd();

                                FCMResponse response = Newtonsoft.Json.JsonConvert.DeserializeObject<FCMResponse>(responseFromFirebaseServer);
                                if (response.success == 1) { }
                                else if (response.failure == 1) { }                               

                            }
                        }
                    }
                }               
            }
            catch (Exception ex) {               
            }
        }

        public void SendPushNotificationSwopRequest(SwopRequestResponse request, string Username)
        {

            string serverKey = "AAAAROeTFGk:APA91bFQ1Znu1dj2tQiPU6Y_a7mtahwcerMfXFRjelrtKOS200qNDK2BWwmIe1ceNgZRqT3Qv3VZ_DOhfycVhankeyflOHbHtCXTsRDFE-a37tSc-myPerk50Kv9bFQMsR-5pDL0YvOA";
            string senderId = "295942952041";
            serverKey = WebConfigurationManager.AppSettings["ServerKey"];
            senderId = WebConfigurationManager.AppSettings["SenderId"];
            try
            {
                WebRequest tRequest = WebRequest.Create("https://fcm.googleapis.com/fcm/send");
                tRequest.Method = "post";
                tRequest.ContentType = "application/json";
                var objNotification = new
                {
                    to = "/topics/" + Username,
                    data = new
                    {
                        Type = "SwopRequest",
                        Request = request
                    }
                };
                string jsonNotificationFormat = Newtonsoft.Json.JsonConvert.SerializeObject(objNotification);

                Byte[] byteArray = Encoding.UTF8.GetBytes(jsonNotificationFormat);
                tRequest.Headers.Add(string.Format("Authorization: key={0}", serverKey));
                tRequest.Headers.Add(string.Format("Sender: id={0}", senderId));
                tRequest.ContentLength = byteArray.Length;
                tRequest.ContentType = "application/json";
                using (Stream dataStream = tRequest.GetRequestStream())
                {
                    dataStream.Write(byteArray, 0, byteArray.Length);

                    using (WebResponse tResponse = tRequest.GetResponse())
                    {
                        using (Stream dataStreamResponse = tResponse.GetResponseStream())
                        {
                            using (StreamReader tReader = new StreamReader(dataStreamResponse))
                            {
                                String responseFromFirebaseServer = tReader.ReadToEnd();

                                FCMResponse response = Newtonsoft.Json.JsonConvert.DeserializeObject<FCMResponse>(responseFromFirebaseServer);
                                if (response.success == 1) { }
                                else if (response.failure == 1) { }

                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
        public ResponseData SendEmail()
        {
            //SendPushNotification();
            return null;

            var fromAddress = new MailAddress("swopitumar@gmail.com", "Umar gmail");
            var toAddress = new MailAddress("alpha_cs111@yahoo.com", "Umar Yahoo");
            const string fromPassword = "pioneer007";
            const string subject = "Subject";
           string body = "Body " + DateTime.Now.ToString();

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };
            using (var message = new MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = body
            })
            {
                smtp.Send(message);
            }

            return null;
        }
        public ResponseData UploadTextFile(Stream Image)
        {            
            string FilePath = Path.Combine(HostingEnvironment.MapPath("~/Attachments/" + "TxtFiles" + "/"), "file" + DateTime.Now.Second + ".txt");
              using (var output = File.Open(FilePath, FileMode.Create))
                Image.CopyTo(output);

            return new ResponseData
            {
                ResponseCode = (int)ResponseCodes.Success,
                          };
        }

    }// End of class
} // End of namespace
