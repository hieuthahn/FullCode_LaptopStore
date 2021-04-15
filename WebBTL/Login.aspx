<%@ Page Title="" Language="C#" MasterPageFile="~/Core.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebBTL.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<form runat="server">--%>
        <!-- Modal Layout -->
        <div class="modal">
            <div class="modal__overlay"></div>
            <div class="modal__body">           
                <!-- Login form -->
                <div class="auth-form">
                    <div class="auth-form__container">
                        <div class="auth-form__header">
                            <h3 class="auth-form__heading">Đăng nhập</h3>
                            <span class="auth-form__switch-btn">
                                <a href="Register.aspx" style="text-decoration: none; color: var(--primary-color); font-weight: 500">Đăng ký</a>
                            </span>
                        </div>
                        <div class="auth-form__form">
                            <div class="auth-form_group">
                                <%--<input type="text" class="auth-form__input" id="input" placeholder="Tên đăng nhập"/>--%>
                                <asp:TextBox ID="tbUserName" class="auth-form__input" runat="server" placeholder="Tên đăng nhập"></asp:TextBox>
                            </div>
                            <div class="auth-form_group">
                                <%--<input type="password" class="auth-form__input" placeholder="Mật khẩu"/>--%>
                                <asp:TextBox ID="tbPassword" class="auth-form__input" runat="server" type="password" placeholder="Mật khẩu"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="auth-form__aside">
                            <div class="auth-form__help">
                                <a href="" class="auth-form__help-link auth-form__help-link-forgot">Quên mật khẩu</a>
                                <span class="auth-form__help-separate"></span>
                                <a href="" class="auth-form__help-link ">Cần trợ giúp?</a>
                            </div>
                            <asp:Label ID="Label1" class="auth-form__help-link auth-form__help-link-forgot" runat="server" Text=""></asp:Label>
                        </div>

                        <div class="auth-form__controls">
                            <button class="btn--normal btn auth-form__controls-back ">
                                <a href="Index.aspx" style="text-decoration: none; color: var(--text-color); font-weight: 400">TRỞ LẠI</a>
                            </button>
                            <%--<button class="btn btn--primary" id="btnLogin" >
                                ĐĂNG NHẬP--%>
                                <asp:Button ID="Button1" class="btn btn--primary" runat="server" OnClick="btnLogin_Click" Text="ĐĂNG NHẬP"/>
                            <%--</button>--%>
                        </div>
                    </div>
                    <div class="auth-form__socials">
                        <a href="" class="auth-form__socials--facebook btn btn--size-s btn--with-icon">
                            <i class="auth-form__socials-icon fab fa-facebook-square "></i>
                            <span class="auth-form__socials-title">Kết nối với Facebook</span>
                        </a>
                        <a href="" class="auth-form__socials--google btn btn--size-s btn--with-icon">
                            <i class="auth-form__socials-icon fab fa-google"></i>
                            <span class="auth-form__socials-title">Kết nối với Google</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    <%--</form>--%>

</asp:Content>
