<%@ Page Title="" Language="C#" MasterPageFile="~/Core.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebBTL.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <!-- Modal Layout -->
        <div class="modal">
            <div class="modal__overlay"></div>
            <div class="modal__body">
                <!-- Register form -->
                <%--<form id="form__register" method="post" onsubmit="return check()">--%>
                    <div class="auth-form">
                        <div class="auth-form__container">
                            <div class="auth-form__header">
                                <h3 class="auth-form__heading">Đăng ký</h3>
                                <span class="auth-form__switch-btn">
                                    <a href="Login.aspx" style="text-decoration: none; color: var(--primary-color); font-weight: 500">Đăng nhập</a>
                                </span>
                            </div>
                            <%--<asp:Label ID="register__notify" style="color:red; font-size:14px; padding:10px" runat="server"></asp:Label>--%>
                            <div class="auth-form__form">
                                <div class="auth-form_group">
                                    <asp:TextBox ID="tbRegisterUserName" class="auth-form__input" runat="server" placeholder="Tên đăng nhập"></asp:TextBox>
                                </div>
                                <div class="auth-form_group">
                                    <asp:TextBox ID="tbRegisterPassword" class="auth-form__input" runat="server" type="password" placeholder="Mật khẩu"></asp:TextBox>
                                </div>
                                <div class="auth-form_group">
                                    <asp:TextBox ID="tbRegisterRePassword" class="auth-form__input" runat="server" type="password" placeholder="Nhập Lại Mật khẩu"></asp:TextBox>
                                </div>
                            </div>
                        
                            <div class="auth-form__aside">
                                <p class="auth-form__policy-text">
                                    Bằng việc đăng kí, bạn đã đồng ý với Laptop-World về
                                    <a href="/" class="auth-form__text-link">Điều khoản dịch vụ</a> &
                                    <a href="/" class="auth-form__text-link">chính sách bảo mật</a>
                                </p>
                                <asp:Label ID="LabelRegister" class="auth-form__help-link auth-form__help-link-forgot" runat="server" Text=""></asp:Label>
                            </div>

                            <div class="auth-form__controls">
                                <button id="btn__register-back" class="btn--normal btn auth-form__controls-back" onclick="index.html">
                                    <a href="Index.aspx" style="text-decoration: none; color: var(--text-color); font-weight: 400">TRỞ LẠI</a>
                                </button>
                                <%--<button id="btn__register-key" class="btn btn--primary">ĐĂNG KÝ</button>--%>
                                <asp:Button ID="ButtonRegister" class="btn btn--primary" runat="server" OnClientClick="check()" OnClick="btnRegister_Click" Text="Đăng Ký"/>
                            </div>
                        </div>
                        <div class="auth-form__socials">
                            <a href="/" class="auth-form__socials--facebook btn btn--size-s btn--with-icon">
                                <i class="auth-form__socials-icon fab fa-facebook-square "></i>
                                <span class="auth-form__socials-title">Kết nối với Facebook</span>
                            </a>
                            <a href="/" class="auth-form__socials--google btn btn--size-s btn--with-icon">
                                <i class="auth-form__socials-icon fab fa-google"></i>
                                <span class="auth-form__socials-title">Kết nối với Google</span>
                            </a>
                        </div>
                    </div>
                <%--</form>--%>
            </div>
        </div>
    <script type="text/javascript">
        function check() {
            var name = document.getElementById("input__register-name").value;
            var pw = document.getElementById("input__register-pw").value;
            var pw_retype = document.getElementById("input__register-pw-retype").value;
            if (name == "")
            {
                alert("Bạn cần nhập họ tên");
                return false;
            }
            if (pw == "" || pw_retype == "")
            {
                alert("Bạn cần nhập mật khẩu");
                return false;
            }
            if (pw_retype != pw)
            {
                alert("Mật khẩu nhập lại không trùng với mật khẩu đã nhập");
                return false;
            }
            if (pw.length < 6)
            {
                alert("Mật khẩu phải đủ 6 ký tự trở trên");
                return false;
            }
            return true;
        }
    </script>

</asp:Content>
