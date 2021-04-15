<%@ Page Title="" Language="C#" MasterPageFile="~/Core.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="WebBTL.ViewCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="app__container">
            <div class="address-selection__container">
                <div class="address-selection__header">
                    <i class="address-selection__heading-icon fas fa-map-marker-alt"></i>
                    <h4 class="address-selection__heading">Địa chỉ nhận hàng</h4>
                </div>
                <div class="row address-selection__title">
                    <span class="col l-3 m-3 c-6 address-selection__title-name">Họ tên</span>
                    <span class="col l-3 m-3 c-6 address-selection__title-phone">Số điện thoại</span>
                    <span class="col l-3 m-3 c-6 address-selection__title-location">Địa chỉ</span>
                    <span class="col l-3 m-3 c-6 address-selection__title-note">Ghi chú</span>
                </div>
                <div class="address-selection__location">
                    <ul class="address-selection__location-list">
                        <li class="row address-selection__item">
                            <div class="col l-3 m-3 c-6 address-selection__item-user-name">
                                <i class="address-selection__item-icon far fa-dot-circle"></i>
                                <span class="address-selection__item-user-name">Thành Hiếu</span>
                            </div>
                            <span class="col l-3 m-3 c-6 span address-selection__item-user-phone">0969430169</span>
                            <span class="col l-3 m-3 c-6 span address-selection__item-user-location">Hà Nội</span>
                            <span class="col l-3 m-3 c-6 address-selection__item-user-note">Ghi chú</span>
                        </li>
                    </ul>
                </div>
                <div class="span address-selection__btn">
                    <button class="address-selection__btn-new-address btn">Thêm địa chỉ mới</button>
                    <button class="address-selection__btn-complete btn btn--primary">Hoàn Thành</button>
                </div>
            </div>  

            <div class="grid cart-content">
                <div class="row cart__header">
                    <div class="col l-5 m-5 cart__heading-product-name">Sản phẩm</div>
                    <div class="col l-2 m-2 cart__heading-product-price">Giá</div>
                    <div class="col l-2 m-2 cart__heading-product-quantity">Số lượng</div>
                    <div class="col l-2 m-2 cart__heading-product-total-price">Số tiền</div>
                    <div class="col l-1 m-1 cart__heading-product-remove">Thao tác</div>
                </div>

                <div class="cart__section">
                    <asp:ListView ID="ListViewCart" runat="server" OnItemDeleting="ListViewCart_ItemDeleting" >
                        <ItemTemplate>
                        <div class="row cart__section-items">
                            <div class="col l-5 m-5 cart-item__content-describe">
                                <input type="checkbox" class="cart-item__content-checkbox"/>
                                <a href="" class="cart-item-picture-link"> 
                                    <img src="<%# Eval("Link") %>" alt="" class="cart-item-picture"/>
                                </a>
                                <h4 class="cart-item__content-name">
                                    <a href="" class="cart-item__content-name-link"><%# Eval("ProductName") %></a>
                                </h4>
                            </div>
                            <div class="col l-7 m-7 cart-item__content-detail">
                                <span class="cart-item__content-detail-price"><%# Eval("UnitPriceNew") %></span>
                                <div class="product-count__fix">
                                    <button class="product-count__fix-btn">
                                        <i class="product-count__fix-icon fas fa-minus"></i>
                                    </button>
                                    <input type="number" class="product-count__fix-count-number" value="<%# Eval("Quantity") %>"></input>
                                    <button class="product-count__fix-btn">
                                        <i class="product-count__fix-icon fas fa-plus"></i>
                                    </button>
                                </div>
                                <span class="cart-item__content-detail-total-price"><%# Eval("TotalPrice") %></span>
                                <button class="cart-item__content-detail-actions btn-remove-js">Xoá</button>
                            </div>
                        </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>

            <div class="cart__footer">
                <div class="cart__footer-select">
                    <input type="checkbox" class="cart__footer-checkbox">
                    <button class="cart__footer-btn-check-all">Chọn tất cả</button>
                </div>
                <div class="cart__footer-view-price-pay">
                    <div class="cart__footer-total-price">
                        <span class="cart__footer-text">Tổng tiền hàng: </span>
                        <span class="cart__footer-total-price">0</span>
                    </div>
                    <button class="cart__footer-btn-pay btn btn--primary">Mua Hàng</button>
                </div>
            </div>
        </div>
</asp:Content>
