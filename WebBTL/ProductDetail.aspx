
<%@ Page Title="" Language="C#" MasterPageFile="~/Core.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="WebBTL.Chitietmathang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="AddToCart" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanHangBTLConnectionString %>" DeleteCommand="DELETE FROM [Product] WHERE [ProductID] = @ProductID" InsertCommand="INSERT INTO [Product] ([ProductName], [Description], [ImagePath], [UnitPriceNew], [UnitPriceOld], [CategoryBỏ], [Link], [Category]) VALUES (@ProductName, @Description, @ImagePath, @UnitPriceNew, @UnitPriceOld, @CategoryBỏ, @Link, @Category)" SelectCommand="SELECT * FROM [Product] WHERE ([ProductID] = @ProductID)" UpdateCommand="UPDATE [Product] SET [ProductName] = @ProductName, [Description] = @Description, [ImagePath] = @ImagePath, [UnitPriceNew] = @UnitPriceNew, [UnitPriceOld] = @UnitPriceOld, [CategoryBỏ] = @CategoryBỏ, [Link] = @Link, [Category] = @Category WHERE [ProductID] = @ProductID">
    <DeleteParameters>
        <asp:Parameter Name="ProductID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ProductName" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="ImagePath" Type="String" />
        <asp:Parameter Name="UnitPriceNew" Type="Double" />
        <asp:Parameter Name="UnitPriceOld" Type="Double" />
        <asp:Parameter Name="CategoryBỏ" Type="String" />
        <asp:Parameter Name="Link" Type="String" />
        <asp:Parameter Name="Category" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="ProductID" QueryStringField="addToCartId" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="ProductName" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="ImagePath" Type="String" />
        <asp:Parameter Name="UnitPriceNew" Type="Double" />
        <asp:Parameter Name="UnitPriceOld" Type="Double" />
        <asp:Parameter Name="CategoryBỏ" Type="String" />
        <asp:Parameter Name="Link" Type="String" />
        <asp:Parameter Name="Category" Type="String" />
        <asp:Parameter Name="ProductID" Type="Int32" />
    </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="ProductDetail" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanHangBTLConnectionString %>" SelectCommand="SELECT * FROM [Product] WHERE ([ProductName] = @ProductName)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductName" QueryStringField="productName" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebBanHangBTLConnectionString %>" SelectCommand="SELECT * FROM Product"></asp:SqlDataSource>
<%--    <style>
        .pruduct-hover {
            display: none
        }

        .product-image__large:hover .product-hover{
            display: block;
        }

        .product-hover::before {
            content: "";
            border-width: 20px 27px;
            border-style: solid;
            border-color: transparent transparent var(--white-color) transparent;
            position: absolute;
            right: 4px;
            top: -29px;
        }

        .product-hover::after {
            content: "";
            display: block;
            position: absolute;
            width: 90px;
            height: 20px;
            right: 0;
            top: -16px;
        } 
    </style>--%>
    <div class="app__container ">
        <div class="grid wide">
            <div class="row product-detail__contain-row">
                <div class="col l-5 m-12 c-12">
                    <asp:ListView ID="ListView1" runat="server" DataMember="DefaultView" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <%--<div class="pruduct-hover" >
                                <span class="product-detail__heading"><%# Eval("ProductName") %></span>
                                <div class="product-detail__price">
                                    <span class="product-info__describe-label" style="font-size: 14px;margin-right: 20px;">Giá hiện tại:</span> 
                                    <span class="product-detail__price-old"><%# Eval("UnitPriceOld") %></span>
                                    <span class="product-detail__price-current"><%# Eval("UnitPriceNew") %></span>
                                </div>
                                <div class="product-info">
                                    <div class="product-info__describe">
                                        <span class="product-info__describe-label">Thông tin</span>
                                        <span class="product-info__describe-text">Đây là mẫu laptop văn phòng có cấu hình mạnh, phục vụ tốt nhu cầu văn phòng và đồ họa. Với thiết kế đơn giản, dung lượng lưu trữ lớn và các tính năng hiện đại, hiện tại đây là một chiếc máy đáng sở hữu trong tầm giá.</span>
                                    </div>
                                </div>
                            </div>--%>
                            <img src="<%# Eval("Link") %>" alt="" class="product-image__large product-image__large-hover"/>
                            <%--<div class="product-image__large" style="background-image: url(<%# Eval("Link") %>); background-repeat: no-repeat;background-size: contain;
                            background-position: top center;">
                            </div>--%>
                            <div class="product-images">
                                <div class="product-images__second">
                                    <img src="https://cf.shopee.vn/file/16c6b1395e3d1417f47c8310f572d52e" alt="" class="product-image__small"/>
                                    <img src="https://cf.shopee.vn/file/316da39e5caf7422f4bfce068e757120" alt="" class="product-image__small"/>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
                
                <div class="col l-7 m-12 c-12">
                    <div class="product-detail">
                        <asp:ListView ID="ListView2" runat="server" DataMember="DefaultView" DataSourceID="SqlDataSource1" OnItemCommand="ListView2_ItemCommand">
                            <ItemTemplate>
                                <span class="product-detail__heading"><%# Eval("ProductName") %></span>
                                <div class="product-detail__price">
                                    <span class="product-info__describe-label" style="font-size: 14px;margin-right: 20px;">Giá hiện tại:</span> 
                                    <span class="product-detail__price-old"><%# Eval("UnitPriceOld") %></span>
                                    <span class="product-detail__price-current"><%# Eval("UnitPriceNew") %></span>
                                </div>
                                <div class="product-info">
                                    <div class="product-info__describe">
                                        <span class="product-info__describe-label">Thông tin</span>
                                        <span class="product-info__describe-text">Đây là mẫu laptop văn phòng có cấu hình mạnh, phục vụ tốt nhu cầu văn phòng và đồ họa. Với thiết kế đơn giản, dung lượng lưu trữ lớn và các tính năng hiện đại, hiện tại đây là một chiếc máy đáng sở hữu trong tầm giá.</span>
                                    </div>
                                </div>
                                <div class="product-count">
                                    <div class="product-count__label">Số lượng</div>
                                    <div class="product-count__fix">
                                        <button class="product-count__fix-btn">
                                            <i class="product-count__fix-icon fas fa-minus"></i>
                                        </button>
                                        <input type="number" id="quantity" class="product-count__fix-count-number" value="1"></input>
                                        <button class="product-count__fix-btn">
                                            <i class="product-count__fix-icon fas fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="product-action">
                                    <asp:LinkButton ID="LinkButton2" runat="server" class="product-action__add-to-cart-btn btn btn-add-to-cart-js btn-add-to-cart-js">
                                        <i class="product-action__add-to-cart-icon fas fa-cart-plus"></i>
                                        <span class="product-action__add-to-cart-label" >Thêm vào giỏ hàng</span>
                                    </asp:LinkButton>
                                    <%--<asp:LinkButton ID="LinkButtonSearch" class="product-action__add-to-cart-btn btn btn--primary" runat="server" CommandName="BuyNow" CommandArgument="<%# Eval("ProductID") %>" />
                                    </asp:LinkButton>--%>
                                    <asp:LinkButton ID="LinkButton1" class="product-action__add-to-cart-btn btn btn--primary" runat="server" CommandName="BuyNow" CommandArgument='<%# Eval("ProductID") %>' >Mua Ngay</asp:LinkButton>
                                    <%--<button class="product-action__add-to-cart-btn btn btn--primary">
                                        Mua Ngay
                                    </button>--%>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>

                </div>
            </div>
            <asp:Label ID="Lb_Viewed" runat="server" Text="" Font-Size="Large"></asp:Label>
            <div class="row">
                <div class="col l-10 m-12 c-12 product__related-col">
                    <!-- Product another related -->
                    <h4 class="product__related-heading">Sản phẩm liên quan</h4>
                    <div class="row product__related-row">    
                        <div class="col l-2-4 m-4 c-6 ">
                            <a href="" class="product__related-item">
                                <div class="product__related-item__img" style="background-image: url(https://bit.ly/2ynZerk);"></div>
                                <h4 class="product__related-item__name">Laptop Dell Inspiron N5584 CXGR01</h4>
                                <div class="product__related-item__price">
                                    <span class="product__related-item__price-old">16.959.000</span>
                                    <span class="product__related-item__price-current">15.360.000</span>
                                </div>
                            </a>
                        </div>
                        <div class="col l-2-4 m-4 c-6">
                            <a href="" class="product__related-item">
                                <div class="product__related-item__img" style="background-image: url(https://bit.ly/2ynZerk);"></div>
                                <h4 class="product__related-item__name">Laptop Dell Inspiron N5584 CXGR01 </h4>
                                <div class="product__related-item__price">
                                    <span class="product__related-item__price-old">16.959.000</span>
                                    <span class="product__related-item__price-current">15.360.000</span>
                                </div>
                            </a>
                        </div>
                        <div class="col l-2-4 m-4 c-6">
                            <a href="" class="product__related-item">
                                <div class="product__related-item__img" style="background-image: url(https://bit.ly/2ynZerk);"></div>
                                <h4 class="product__related-item__name">Laptop Dell Inspiron N5584 CXGR01 </h4>
                                <div class="product__related-item__price">
                                    <span class="product__related-item__price-old">16.959.000</span>
                                    <span class="product__related-item__price-current">15.360.000</span>
                                </div>
                            </a>
                        </div>
                        <div class="col l-2-4 m-4 c-6">
                            <a href="" class="product__related-item">
                                <div class="product__related-item__img" style="background-image: url(https://bit.ly/2ynZerk);"></div>
                                <h4 class="product__related-item__name">Laptop Dell Inspiron N5584 CXGR01 </h4>
                                <div class="product__related-item__price">
                                    <span class="product__related-item__price-old">16.959.000</span>
                                    <span class="product__related-item__price-current">15.360.000</span>
                                </div>
                            </a>
                        </div>
                        <div class="col l-2-4 m-4 c-6">
                            <a href="" class="product__related-item">
                                <div class="product__related-item__img" style="background-image: url(https://bit.ly/2ynZerk);"></div>
                                <h4 class="product__related-item__name">Laptop Dell Inspiron N5584 CXGR01 </h4>
                                <div class="product__related-item__price">
                                    <span class="product__related-item__price-old">16.959.000</span>
                                    <span class="product__related-item__price-current">15.360.000</span>
                                </div>
                            </a>
                        </div>
                    </div>
                    <!-- Product another hot sale -->
                    <h4 class="product__related-heading">Sản phẩm khác</h4>
                    <div class="row product__related-row">
                        <div class="col l-2-4 m-4 c-6">
                            <a href="" class="product__related-item">
                                <div class="product__related-item__img" style="background-image: url(https://bit.ly/2ynZerk);"></div>
                                <h4 class="product__related-item__name">Laptop Dell Inspiron N5584 CXGR01 </h4>
                                <div class="product__related-item__price">
                                    <span class="product__related-item__price-old">16.959.000</span>
                                    <span class="product__related-item__price-current">15.360.000</span>
                                </div>
                            </a>
                        </div>
                        <div class="col l-2-4 m-4 c-6">
                            <a href="" class="product__related-item">
                                <div class="product__related-item__img" style="background-image: url(https://bit.ly/2ynZerk);"></div>
                                <h4 class="product__related-item__name">Laptop Dell Inspiron N5584 CXGR01 </h4>
                                <div class="product__related-item__price">
                                    <span class="product__related-item__price-old">16.959.000</span>
                                    <span class="product__related-item__price-current">15.360.000</span>
                                </div>
                            </a>
                        </div>
                        <div class="col l-2-4 m-4 c-6">
                            <a href="" class="product__related-item">
                                <div class="product__related-item__img" style="background-image: url(https://bit.ly/2ynZerk);"></div>
                                <h4 class="product__related-item__name">Laptop Dell Inspiron N5584 CXGR01 </h4>
                                <div class="product__related-item__price">
                                    <span class="product__related-item__price-old">16.959.000</span>
                                    <span class="product__related-item__price-current">15.360.000</span>
                                </div>
                            </a>
                        </div>
                        <div class="col l-2-4 m-4 c-6">
                            <a href="" class="product__related-item">
                                <div class="product__related-item__img" style="background-image: url(https://bit.ly/2ynZerk);"></div>
                                <h4 class="product__related-item__name">Laptop Dell Inspiron N5584 CXGR01 </h4>
                                <div class="product__related-item__price">
                                    <span class="product__related-item__price-old">16.959.000</span>
                                    <span class="product__related-item__price-current">15.360.000</span>
                                </div>
                            </a>
                        </div>
                        <div class="col l-2-4 m-4 c-6">
                            <a href="" class="product__related-item">
                                <div class="product__related-item__img" style="background-image: url(https://bit.ly/2ynZerk);"></div>
                                <h4 class="product__related-item__name">Laptop Dell Inspiron N5584 CXGR01 </h4>
                                <div class="product__related-item__price">
                                    <span class="product__related-item__price-old">16.959.000</span>
                                    <span class="product__related-item__price-current">15.360.000</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                        
                <!-- Product another hot sale aside -->
                <div class="col l-2 m-0 c-0 product__related-aside-col">
                    <h4 class="product__related-heading-aside">Sản phẩm HOT</h4>
                    <div class="product__related-aside ">      
                        <a href="" class="product__related-item">
                            <div class="product__related-item__img" style="background-image: url(https://bit.ly/2ynZerk);"></div>
                            <h4 class="product__related-item__name">Laptop Dell Inspiron N5584 CXGR01</h4>
                            <div class="product__related-item__price">
                                <span class="product__related-item__price-old">16.959.000</span>
                                <span class="product__related-item__price-current">15.360.000</span>
                            </div>
                        </a>
                    </div>
                    <div class="product__related-aside">      
                        <a href="" class="product__related-item">
                            <div class="product__related-item__img" style="background-image: url(https://bit.ly/2ynZerk);"></div>
                            <h4 class="product__related-item__name">Laptop Dell Inspiron N5584 CXGR01</h4>
                            <div class="product__related-item__price">
                                <span class="product__related-item__price-old">16.959.000</span>
                                <span class="product__related-item__price-current">15.360.000</span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
