<%@ Page Title="" Language="C#" MasterPageFile="~/Core.Master" AutoEventWireup="True" CodeBehind="Index.aspx.cs" Inherits="WebBTL.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SortProductASC_Category" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanHangBTLConnectionString %>" SelectCommand="SELECT * FROM [Product] WHERE ([Category] = @Category) ORDER BY [UnitPriceNew]">
        <SelectParameters>
            <asp:QueryStringParameter Name="Category" QueryStringField="category" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SortProductDSC_Category" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanHangBTLConnectionString %>" SelectCommand="SELECT * FROM [Product] WHERE ([Category] = @Category) ORDER BY [UnitPriceNew] DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="Category" QueryStringField="category" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SortProductASC" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanHangBTLConnectionString %>" SelectCommand="SELECT * FROM [Product] ORDER BY [UnitPriceNew]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SortProductDSC" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanHangBTLConnectionString %>" SelectCommand="SELECT * FROM [Product] ORDER BY [UnitPriceNew] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="ProductSearch" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanHangBTLConnectionString %>" SelectCommand="SELECT * FROM [Product] WHERE ([ProductName] LIKE '%' + @ProductName + '%')">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductName" QueryStringField="productName" Type="String" />
        </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="ProductListCategory" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanHangBTLConnectionString %>" SelectCommand="SELECT * FROM [Product] WHERE ([Category] = @Category)">
    <SelectParameters>
        <asp:QueryStringParameter Name="Category" QueryStringField="category" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="CategoryList" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanHangBTLConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanHangBTLConnectionString %>" SelectCommand="SELECT * FROM Product"></asp:SqlDataSource>
    <%--<a href="" class="select-input__link">Giá cao đến thấp</a>--%>
        <div class="app__container">
            <div class="grid wide">
                <div class="row sm-gutter app__content">
                    <div class="col l-2 m-0 c-0">
                        <nav class="category">
                            <h3 class="category__heading">
                                <i class="category__heading-icon fas fa-list"></i>
                                Danh mục
                            </h3>
                            <ul class="category-list">
                                <asp:ListView ID="ListView1" runat="server" DataMember="DefaultView" DataSourceID="CategoryList">
                                    <ItemTemplate>
                                        <li class="category-item" id="categoryFirst" >
                                            <%--<asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="Index.aspx?category=<%# Eval("CategoryName") %>" >
                                                <%# Eval("CategoryName") %>--%>
                                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">
                                            <a href="Index.aspx?category=<%# Eval("CategoryName") %>" class="category-item__link">
                                                <%# Eval("CategoryName") %>
                                            </a>
                                            </asp:LinkButton>
                                        </li>
                                    </ItemTemplate>
                                </asp:ListView>
                                <li class="category-item">
                                    <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Index.aspx" OnClick="LinkButton2_Click" class="category-item__link">
                                            Tất cả
                                    </asp:LinkButton>
                                </li>
                            </ul>
                        </nav>
                    </div>

                    <div class="col l-10 m-12 c-12">
                        <div class="home-filter hide-on-mobile-table">
                            <span class="home-filter__label">Sắp xếp theo</span>
                            <button class="btn home-filter__btn">Phổ biến</button>
                            <button class="btn home-filter__btn btn--primary">Mới nhất</button>
                            <button class="btn home-filter__btn">Bán chạy</button>

                            <!-- List option -->
                            <div class="select-input">
                                <span class="select-input__label">Giá</span>
                                <i class="select-input__icon fas fa-angle-down"></i>
                                <ul class="select-input__list">
                                    <li class="select-input__item">
                                        <%--<asp:LinkButton ID="LinkButtonASC" class="select-input__link" runat="server">Giá thấp đến cao </asp:LinkButton>--%>
                                        <asp:LinkButton ID="LinkButtonASC" class="select-input__link" runat="server" OnClick="LinkButtonASC_Click">Giá thấp đến cao </asp:LinkButton>
                                        <%--<asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImagePath") %>'/>--%>
                                    </li>
                                    <li class="select-input__item">
                                        <%--<asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImagePath") %>'/>--%>
                                        <%--<asp:LinkButton ID="LinkButton3" class="select-input__link" runat="server" >Giá cao đến thấp </asp:LinkButton>--%>
                                        <asp:LinkButton ID="LinkButtonDSC" class="select-input__link" runat="server" OnClick="LinkButtonDSC_Click">Giá cao đến thấp </asp:LinkButton>
                                        <%--<asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImagePath") %>'/>--%>
                                    </li>
                                </ul>
                            </div>

                            <div class="home-filter__page">
                                <span class="home-filter__page-num">
                                    <%--<span class="home-filter__page-current">1</span>--%>
                                        <asp:Label ID="LabelPageCount" class="home-filter__page-current" runat="server" Text="1"></asp:Label>/3
                                </span>

                                <div class="home-filter__page-control">
                                    <asp:LinkButton ID="LinkButtonPageBack" class="home-filter__page-btn" OnClick="LinkButtonPageBack_Click" runat="server">
                                        <i class="home-filter__page-icon fas fa-angle-left"></i>
                                    </asp:LinkButton>
                                    <%--<a href="" class="home-filter__page-btn home-filter__page-btn--disabled">
                                        <i class="home-filter__page-icon fas fa-angle-left"></i>
                                    </a>--%>
                                    <asp:LinkButton ID="LinkButtonPageNext" class="home-filter__page-btn" OnClick="LinkButtonPageNext_Click" runat="server">
                                        <i class="home-filter__page-icon fas fa-angle-right"></i>
                                    </asp:LinkButton>
                                    <%--<a href="" class="home-filter__page-btn">
                                        <i class="home-filter__page-icon fas fa-angle-right"></i>
                                    </a>--%>
                                </div>
                            </div>
                        </div>

                        <nav class="mobile-category">
                            <ul class="mobile-category__list">
                                <li class="mobile-category__item">
                                    <a href="" class="mobile-category__link">Laptop Dell</a>
                                </li>
                                <li class="mobile-category__item">
                                    <a href="" class="mobile-category__link">Laptop Asus</a>
                                </li>
                                <li class="mobile-category__item">
                                    <a href="" class="mobile-category__link">Laptop HP</a>
                                </li>
                                <li class="mobile-category__item">
                                    <a href="" class="mobile-category__link">Laptop Lenovo</a>
                                </li>
                                <li class="mobile-category__item">
                                    <a href="" class="mobile-category__link">Laptop Thinkpad</a>
                                </li>
                                <li class="mobile-category__item">
                                    <a href="" class="mobile-category__link">Laptop Acer</a>
                                </li>
                            </ul>
                        </nav>

                        <div class="home-pruduct">
                            <div class="row sm-gutter">
                                <!-- Product item DataSourceID="SqlDataSource1" RepeatColumns="5" -->
                                <%--<asp:ListView ID="ListView2" runat="server" DataMember="DefaultView" DataSourceID="SqlDataSource1" RepeatColumns="5" RepeatDirection="Horizontal" > --%>
                                <asp:ListView ID="ListView2" runat="server" DataMember="DefaultView"  RepeatDirection="Horizontal" >
                                    <ItemTemplate>
                                        <%--<div class="col l-2-4 m-4 c-6">--%>
                                        <div class="col l-2-4">
                                            <a href="ProductDetail.aspx?productname=<%# Eval("ProductName") %>" class="home-product-item">
                                                <div class="home-product-item__img" style="background-image: url(<%# Eval("Link") %>);">
                                                    <%--<asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImagePath") %>'/>--%>
                                                </div>
                                                <%--<img src="<%# Eval("ImagePath") %>" alt="Alternate Text" class="home-product-item__img"/>--%>
                                                <h4 class="home-product-item__name"><%# Eval("ProductName") %>
                                            
                                                </h4>
                                                <div class="home-product-item__price">
                                                    <span class="home-product-item__price-old"><%# Eval("UnitPriceOld") %>
                                               
                                                    </span>
                                                    <span class="home-product-item__price-current"><%# Eval("UnitPriceNew") %>
                                               
                                                    </span>
                                                </div>
                                                <div class="home-product-item__action">
                                                    <span class="home-product-item__like home-product-item__like--liked">
                                                        <i class="home-product-item__like-icon-empty far fa-heart"></i>
                                                        <i class="home-product-item__like-icon-fill fas fa-heart"></i>
                                                    </span>
                                                    <div class="home-product-item__rating">
                                                        <i class="home-product-item__star--gold fas fa-star"></i>
                                                        <i class="home-product-item__star--gold fas fa-star"></i>
                                                        <i class="home-product-item__star--gold fas fa-star"></i>
                                                        <i class="home-product-item__star--gold fas fa-star"></i>
                                                        <i class="home-product-item__star--gold fas fa-star"></i>
                                                    </div>
                                                    <span class="home-product-item__sold">18 đã bán</span>
                                                </div>
                                                <div class="home-product-item__origin">
                                                    <span class="home-product-item__brand">Dell</span>
                                                    <span class="home-product-item__origin-name">Hà Nội</span>
                                                </div>
                                                <div class="home-product-item__favourite">
                                                    <i class="fas fa-check"></i>
                                                    <span>Yêu thích</span>
                                                </div>
                                                <div class="home-product-item__sale-off">
                                                    <span class="home-product-item__sale-off-percent">11%</span>
                                                    <span class="home-product-item__sale-off-label">GIẢM</span>
                                                </div>
                                            </a>
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
                        </div>

                        <ul class="pagionation home-pruduct__pagination">
                            <li class="pagionation-item">
                                <asp:LinkButton ID="LinkButtonFirstPage" class="pagionation-item__link" OnClick="LinkButtonFirstPage_Click" runat="server">
                                    <i class="pagionation-item__icon fas fa-angle-left"></i>
                                </asp:LinkButton>
                                <%--<a href="" class="pagionation-item__link">
                                    <i class="pagionation-item__icon fas fa-angle-left"></i>
                                </a>--%>
                            </li>
                            <li class="pagionation-item pagionation-item-active">
                                <asp:LinkButton ID="LinkButtonPage1" class="pagionation-item__link" OnClick="LinkButtonPage1_Click" runat="server">1</asp:LinkButton>
                                <%--<a href="" class="pagionation-item__link">1</a>--%>
                            </li>
                            <li class="pagionation-item">
                                <asp:LinkButton ID="LinkButtonPage2" class="pagionation-item__link" OnClick="LinkButtonPage2_Click" runat="server">2</asp:LinkButton>
                                <%--<a href="" class="pagionation-item__link">2</a>--%>
                            </li>
                            <li class="pagionation-item">
                                <asp:LinkButton ID="LinkButtonPage3" class="pagionation-item__link" OnClick="LinkButtonPage3_Click" runat="server">3</asp:LinkButton>
                                <%--<a href="" class="pagionation-item__link">3</a>--%>
                            </li>
                            <%--<li class="pagionation-item pagionation-item-more">
                                <a href="" class="pagionation-item__link">...</a>
                            </li>
                            <li class="pagionation-item">
                                <a href="" class="pagionation-item__link">5</a>
                            </li>--%>
                            <li class="pagionation-item">
                                <asp:LinkButton ID="LinkButtonLastPage" class="pagionation-item__link" OnClick="LinkButtonLastPage_Click" runat="server">
                                    <i class="pagionation-item__icon fas fa-angle-right"></i>
                                </asp:LinkButton>
                                <%--<a href="" class="pagionation-item__link">
                                    <i class="pagionation-item__icon fas fa-angle-right"></i>
                                </a>--%>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

</asp:Content>

