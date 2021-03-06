

from django.urls import path,include
from . import views


 
urlpatterns = [
    path('',views.homepage_view,name='homepage_view'),
    path('usersignup/',views.usersignupView,name = 'usersignup'),
    path('signin/',views.signIcon_view,name = 'signin/'),
    path('registeruser/',views.register_USer_View,name= 'registeruser/'),
    path('selected_Product/<int:id>',views.selected_Product_view,name = 'selected_Product'),
    path('cart/',views.cart_View,name = 'cart'),
    # path('add-to-cart',views.addto_cart_View,name = 'add-to-cart'),
    path('update_item/',views.updateItem, name= 'update_item'),
    path('check_out',views.checkout_view,name  = 'check_out'),
    path('place_order/',views.place_orderView, name= 'place_order'),
    path('proccesing_order/',views.Process_orderView,name = 'proccesing_order'),
    path('ordering/<int:id>/',views.OrderView,name = 'ordering'),
    path('cart_qty/', views.addcartQtyView,name = 'cart_qty'),
    path('checking_address',views.checkingaddressview,name = 'checking_address') ,
    path('products/<int:id>/',views.productpage_View,name = "products"),
    path('order_placing/',views.order_placingView ,name ="order_placing"),
    path('manage_account',views.user_account_View,name = "manage_account"),
    path('cart_items/',views.cart_item_buy_View,name= "cart_items"),
    path('address',views. add_new_address_View,name = 'address'),
    path('new_address/<int:id>/',views.add_new_addresforEachOrder_View,name = 'new_address'),
    path('new_address_adding/<int:id>/',views.newaddress_save_view,name = "new_address_adding"),
    path('my_profile',views.my_profile_view, name = "my_profile"),
    path('delete_address/<int:id>/',views.delete_address_View,name = "delete_address"),
    path('add_new_address',views.add_new_addressfor_userProfile_View,name = "add_new_address"),
    path('cancel_order/<int:id>/',views.cancel_order_view,name = "cancel_order"),
    path('edit_profile',views.editprofile_View,name = 'edit_profile'),
    path('tracking_order/<int:id>/',views.tracking_order_View,name = "tracking_order"),
    path('coupen_check/',views.coupen_check_view,name = "coupen_check"),
    path('my_wishlist',views.mywishlist_view,name = "my_wishlist"), 
    path('add_to_wishlist/',views.add_to_wishlist_view,name = "add_to_wishlist"),
    path('remove_wish_list/<int:id>/',views.delete_wish_list_view,name = "remove_wish_list"),
    path('remove_cart_item/<int:id>/',views.remove_cart_item_View,name ="remove_cart_item"),
    path('order_placed/<int:id>/',views.invoice_view ,name = "order_placed"),
    path('otp_verification',views.otp_verication,name = "otp_verification"),
    path('cart_order_placed/<int:id>/',views.invoice_Cart_view ,name = "order_place"),
    path('razorpay_checkout',views.razorpay_checkout,name = "razorpay_checkout"),
    path('razorpay_cart_checkut',views.razorpay_cart_checkout,name = "razorpay_cart_checkout"),
    path('edit_address/<int:id>/',views.edit_address_view,name = "edit_address"),
    path('edit_address_save',views.edti_address_save_View,name = "edit_address_save"),
    path('login_with_otp',views.login_with_otp,name = "login_with_otp"),
    path('enter_otp_number',views.sending_otp_view,name = "enter_otp_number"),
    path('otp_login_verification',views.otp_login_verification,name = "otp_login_verification"),
    path('timer',views.timercheck,name = "timer")
    

 
    ] 