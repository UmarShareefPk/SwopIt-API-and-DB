using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.IO;

namespace Albertomoll
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    [ServiceKnownType(typeof(GeneralResponse))]
    [ServiceKnownType(typeof(UserDetailsResponse))]
    [ServiceKnownType(typeof(CategoryResponse))]
    [ServiceKnownType(typeof(List<Category>))]
    [ServiceKnownType(typeof(List<SubCategory>))]
 
    [ServiceKnownType(typeof(ItemResponse))]
    [ServiceKnownType(typeof(List<ItemResponse>))]
    [ServiceKnownType(typeof(UserDetailsResponse))]
    [ServiceKnownType(typeof(List<UserDetailsResponse>))]
    [ServiceKnownType(typeof(List<ItemsByDistanceResponse>))]
    [ServiceKnownType(typeof(Error))]
    [ServiceKnownType(typeof(Message))]
    [ServiceKnownType(typeof(ChatReponse))]
    [ServiceKnownType(typeof(List<ChatReponse>))]
    [ServiceKnownType(typeof(List<AddChatReponse>))]
    [ServiceKnownType(typeof(SwopRequestResponse))]
    [ServiceKnownType(typeof(List<SwopRequestResponse>))]
    public interface IAlbertoMollWCF
    {
     
        [WebInvoke(UriTemplate = "AddUser", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData AddUser(Request request);

        [WebInvoke(UriTemplate = "UserAvailablity", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData UserAvailable(Request request);

        [WebInvoke(UriTemplate = "UploadProfilePicture/{UserId}", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData UploadProfilePicture(string UserId, Stream Image);

        [WebInvoke(UriTemplate = "Login", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData Login(Request request);

        [WebInvoke(UriTemplate = "DownloadProfilePicture/{UserId}", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Wrapped)]
        Stream DownloadProfilePicture(string UserId);

        [WebInvoke(UriTemplate = "UpdateUser", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData UpdateUser(Request request);

        [WebInvoke(UriTemplate = "GetAllUsers", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        string GetAllUsers(Request request);

        [WebInvoke(UriTemplate = "GetCategories", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData GetCategories();

        [WebInvoke(UriTemplate = "AddItem", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData AddItem(Request request);

        [WebInvoke(UriTemplate = "GetItemsByUser", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData GetItemsByUser(Request request);

        [WebInvoke(UriTemplate = "GetItemsByUserAndCategory", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData GetItemsByUserAndCategory(Request request);

        [WebInvoke(UriTemplate = "UploadItemImage/{ItemId}/{ImageNumber}", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData UploadItemImage(string ItemId, string ImageNumber, Stream Image);

        [WebInvoke(UriTemplate = "DownloadItemImage/{ItemId}/{ImageNumber}", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Wrapped)]
        Stream DownloadItemImage(string ItemId, string ImageNumber);

        [WebInvoke(UriTemplate = "ItemById", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData GetItemById(Request request);

        [WebInvoke(UriTemplate = "UserById", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData GetUserById(Request request);

        [WebInvoke(UriTemplate = "ItemsByDistance", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData GetItemsByDistance(Request request);

        [WebInvoke(UriTemplate = "ItemsByCategory", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData GetItemsByCategory(Request request);

        [WebInvoke(UriTemplate = "ItemsBySearch", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData GetItemsBySearch(Request request);

        [WebInvoke(UriTemplate = "AddChatMessage", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData AddChatMessage(Request request);

        [WebInvoke(UriTemplate = "AddSwopRequest", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData AddSwopRequest(Request request);

        [WebInvoke(UriTemplate = "UpdateSenderItems", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData UpdateSenderItems(Request request);

        [WebInvoke(UriTemplate = "UpdateSwopRequestStatus", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData UpdateSwopRequestStatus(Request request);

        [WebInvoke(UriTemplate = "ChatByUserId", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData GetChatByUserId(Request request);

        [WebInvoke(UriTemplate = "ChatByTwoUsers", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData GetChatByTwoUser(Request request);

        [WebInvoke(UriTemplate = "SwopRequestByUserId", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData GetSwopRequestByUserId(Request request);

        [WebInvoke(UriTemplate = "SwopRequestTwoUsers", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData GetSwopRequestTwoUsers(Request request);
        // TODO: Add your service operations here

        [WebInvoke(UriTemplate = "AddCoins", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData AddCoins(Request request);

        [WebInvoke(UriTemplate = "UpdateCoins", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData UpdateCoins(Request request);

        [WebInvoke(UriTemplate = "RedeemCoins", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData RedeemCoins(Request request);

        [WebInvoke(UriTemplate = "EvaluateSwopper", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData EvaluateSwopper(Request request);

        [WebInvoke(UriTemplate = "Swoppers", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData GetSwoppers(Request request);

        [WebInvoke(UriTemplate = "LastMessage", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData GetLastMessage(Request request);

        [WebInvoke(UriTemplate = "AcceptedSwopsByUser", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData AcceptedSwopsByUser(Request request);

        [WebInvoke(UriTemplate = "ContactUs", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData ContactUs(Request request);

        [WebInvoke(UriTemplate = "UploadTextFile", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData UploadTextFile(Stream Image);

        [WebInvoke(UriTemplate = "SendEmail", ResponseFormat = WebMessageFormat.Json, RequestFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        ResponseData SendEmail();
    }

}
