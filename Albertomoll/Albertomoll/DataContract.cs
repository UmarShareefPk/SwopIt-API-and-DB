using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Albertomoll
{
    public enum ResponseCodes
    {
        Unspecified = 0,
        Success,
        InvalidCredentials,
        Unauthenticated,
        SessionExpired,
        MalformedRequest,
        NoDataFound,
        DatabaseError,
    }

    public class Request
    {
        public string UserId { get; set; }
        public string Name { get; set; }
        public string Password { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string About { get; set; }
        public string MoreInfo { get; set; }
        public string ProfilePicture { get; set; }
        public string Address { get; set; }
        public string Longitude { get; set; }
        public string Latitude { get; set; }

        ///////////////////////////////////////////// Item
        public string ItemId { get; set; }
        public string ItemName { get; set; }
        public string CategoryId { get; set; }
        public string ItemDetails { get; set; }
        public string ItemCondition { get; set; }

        public string Distance { get; set; }

        public string ChatId { get; set; }
        public string Sender { get; set; }
        public string Reciever { get; set; }
        public string Message { get; set; }

        public string SwopRequestId { get; set; }
        public string SenderItems { get; set; }
        public string RecieverItems { get; set; }
        public string Status { get; set; }
        public string User2Id { get; set; }

        public string Category { get; set; }
        public string SubCategoryId { get; set; }
        public string SearchTxt { get; set; }
        public string Coins { get; set; }
        public string SwopType { get; set; }
        public string BankName { get; set; }
        public string AccountNumber { get; set; }
        public string Rater { get; set; }
        public string Rating { get; set; }

    }
   
    public class UserDetailsResponse
    {
        public string UserId { get; set; }
        public string Name { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string About { get; set; }
        public string MoreInfo { get; set; }
        public string Address { get; set; }
        public string Longitude { get; set; }
        public string Latitude { get; set; }
        public string ProfilePicture { get; set; }
        public string Coins { get; set; }
    }

    public class ItemResponse
    {
       public string ItemId { get; set; }
       public string Name { get; set; }
        public UserDetailsResponse User { get; set; }
        public string PostDate { get; set; }
        public string Details { get; set; }
        public string Condition { get; set; }
        public string Category { get; set; }
        public List<string> Urls { get; set; }
    }

    public class CategoryResponse
    {
         public string Id {get;set;}
         public string Name {get;set;}
         public string MainCategory { get; set; }
    }

    public class Category
    {
        public string Name { get; set; }
        public List<SubCategory> subCategory { get; set; }
    }

    public class SubCategory
    {
        public string Name { get; set; }
        public string Id { get; set; }
    }

    //public class ItemsByDistanceResponse
    //{
    //    public string ItemId { get; set; }
    //    public string ItemName { get; set; }
    //    public string ItemCondition { get; set; }
    //    public string ItemDetails { get; set; }
    //    public string CategoryId { get; set; }
    //    public string ItemPostDate { get; set; }
    //    public string UserId { get; set; }
    //    public string Name { get; set; }
    //    public string Email { get; set; }
    //    public string Phone { get; set; }
    //    public string About { get; set; }
    //    public string MoreInfo { get; set; }
    //    public string Address { get; set; }
    //    public string Distance { get; set; }
    //    public List<string> Urls { get; set; }
    //}
    public class ItemsByDistanceResponse
    {
        public string Distance { get; set; }
        public ItemResponse Item { get; set; }
    }


     public class ChatReponse
    {
        public string ChatId { get; set; }
        public string Sender { get; set; }
        public string Reciever { get; set; }
        public string SenderProfilePic { get; set; }
        public string RecieverProfilePic { get; set; }
        public string Message { get; set; }
        public string Date { get; set; }
    }

    public class AddChatReponse
    {
        public string ChatId { get; set; }
        public UserDetailsResponse Sender { get; set; }
        public UserDetailsResponse Reciever { get; set; }   
        public string Message { get; set; }
        public string Date { get; set; }
    }
    public class Notification
    {
        string Type { get; set; }
        
    }

    public class SwopRequestResponse
    {
        public string SwopRequestId { get; set; }
        public UserDetailsResponse Sender { get; set; }
        public UserDetailsResponse Reciever { get; set; }        
        public string Date { get; set; }
        public string Status { get; set; }
        public List<ItemResponse> SenderItems { get; set; }
        public List<ItemResponse> RecieverItems { get; set; }
        public string SwopType { get; set; }
        public string Coins { get; set; }
    }

    public class ResponseData
    {
        public int ResponseCode { get; set; }
      //  public string ErrorMessage { get; set; }
        public object Response { get; set; }
    }

    public class Error
    {
        public string ErrorMessage { get; set; }
    }

    public class Message
    {
        public string MessageText { get; set; }
    }
    public class GeneralResponse
    {
        public string data { get; set; }
    }
}