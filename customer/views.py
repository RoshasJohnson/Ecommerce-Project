from ast import Return
from audioop import add
from ctypes import addressof
from curses.ascii import NUL
from genericpath import exists
from itertools import product
from multiprocessing import context
from defer import return_value
from django.http import Http404, HttpResponse, JsonResponse
from django.shortcuts import redirect, render
import re
from django.views.decorators.csrf import csrf_protect

import customer
from .models import AbstractUser, Product
from .models import *
from .forms import *
from django.contrib.auth import authenticate
from django import template, views
from django.views.decorators.cache import never_cache
from datetime import date, datetime, timedelta
from email import contentmanager, message
from django.contrib import messages
from urllib import request
from urllib.request import Request
from django import template, views
import json 
from twilio.rest import Client
import os
from decouple import config 



# ========================================================================================================================================= 


number = ''

def SendOTP(num):
    global number 
    number = num
  
    print(number,'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh')

    account_sid = os.environ['TWILIO_ACCOUNT_SID'] =config('TWILIO_ACCOUNT_SID')

    auth_token = os.environ['TWILIO_AUTH_TOKEN'] = config('TWILIO_AUTH_TOKEN')
 
    client = Client(account_sid, auth_token)

    verification = client.verify \
                            .services(config('services')) \
                            .verifications \
                            .create(to=number, channel='sms')
                  
    print(verification.status)
    return True


def check(otp,number):
    print(otp,number)
    
    account_sid = os.environ['TWILIO_ACCOUNT_SID'] =config('TWILIO_ACCOUNT_SID')
    auth_token = os.environ['TWILIO_AUTH_TOKEN'] =config('TWILIO_AUTH_TOKEN')
    client = Client(account_sid, auth_token)
    print('hahahahahaaakkkkkkkkkkkkkkkkkkkkkkk')
    verification_check = client.verify \
                            .services(config('services')) \
                            .verification_checks \
                            .create(to=number, code=otp)
    print(verification_check.status)
    print(verification_check)

    if verification_check.status ==  'approved':
        return True
    else:
        return False
# ========================================================================================================================================= 

# This function for registring the user 

def otp_verication(request):
    if request.session.get('name'):
        user = request.session.get('name')
        user = Usercreation.objects.filter(username = user)
        for i in user: 
            num = i.phone_number
        number       = '+91'+num    
        print(number)
        if request.method  == 'POST':
            otp = request.POST ['number']
            if check(otp,number):
                return redirect('/signin')
            else:
                messages.error(request,'Invalid OTP ') 
    else:
        return redirect('/usersignup/')    


@never_cache
def usersignupView (request):
    if request.method == 'POST':
        form = Customer(request.POST)
        if form.is_valid():                 
                request.session['name'] = request.POST['username']
                num          = request.POST['phone_number']
                number       = '+91'+num

                if SendOTP(number) :
                    form.save()   

                return render(request,'customer/otp.html')                  
    else:
        form = Customer()
    choices  = Category.objects.all()
    contex   = {'form':form,'choices': choices}    
    return render(request,'customer/register.html',contex)

  
# =========================================================================================================================================     
# home page view function
def homepage_view(request):
    Designpage= Design.objects.all()
    for i in Designpage:
        print(i.Banner_image1.url)
    try:    
        if request.session.get('name'):
            user         = request.session.get('name')
            user         = Usercreation.objects.get(username = user)
            everyproduct = Product.objects.all()
            choices      = Category.objects.all() 
            cartcount    =  OrderItem.objects.filter(user = user).count()
            cartitems    = OrderItem.objects.filter(user = user).all 
            contex = {'everyproduct':everyproduct, 
            'Designpage':Designpage,
            'choices':choices,
            'cartcount':cartcount,'cartitems':cartitems,'user':user}
            return render(request,'customer/index.html',contex)

        else:
            session_key = request.session.session_key
            cartcount   = OrderItem.objects.filter(guest_user = session_key).count()
            Designpage   = Design.objects.all()
            everyproduct = Product.objects.all()
            choices      = Category.objects.all()
            order        =  OrderItem.objects.all().count()
            contex       = {'everyproduct':everyproduct,
            'Designpage':Designpage,
            'choices':choices,
            'order':order,'cartcount':cartcount}
            return render(request,'customer/index.html',contex)
    except:
        return redirect('/signin')

# ========================================================================================================================================= 
# select Prdoucted view function
  
  
def selected_Product_view(request,id):
    every_product = Product.objects.all()
    if request.session.get('name'):
        product_offer   = 0
        category_offer  = 0
        selectedProduct = Product.objects.filter(id= id) 
        choices         = Category.objects.all()
        customer        = request.session.get('name')
        user            = Usercreation.objects.get(username = customer)
        cartcount       =  OrderItem.objects.filter(user = user  ).count()
        wishlist        = [i.product for i in MyWishList.objects.filter(username = user)]

        contex          = {'selectedProduct':selectedProduct
        ,'choices':choices,'cartcount':cartcount,'wishlist':wishlist,
        'product_offer':product_offer,
        'category_offer':category_offer,'every_product':every_product }
        return render(request,'customer/selected_product.html',contex)
    else:
        product_offer   = 0
        category_offer  = 0
        session_key = request.session.session_key
        cartcount   = OrderItem.objects.filter(guest_user = session_key).count()
        selectedProduct = Product.objects.filter(id= id) 
        choices = Category.objects.all()
        contex   = {'selectedProduct':selectedProduct,'choices':choices,'product_offer':product_offer,'category_offer':category_offer,
        'cartcount':cartcount,'every_product':every_product}
        return render(request,'customer/selected_product.html',contex)

 

# =========================================================================================================================================  
# sign in view funciton


@never_cache
def signIcon_view(request):
    cartcount = 0
    choices = Category.objects.all()
    form = Customer()
    form = Customer(request.POST or None,request.FILES or None)
    if request.method == 'POST':
        userlogin       = authenticate(username = request.POST['username'],password = request.POST['password1'])
        username        = request.POST['username']
        
        if userlogin is not None:
             usercheck  = Usercreation.objects.get(username = username)
             request.session['name'] = request.POST['username']
             user                    = request.session.get('name')  
             username                = Usercreation.objects.get(username = username)    
             session_key = request.session.session_key
             guest_user = OrderItem.objects.filter(guest_user = session_key)
             for i in guest_user:
                 OrderItem.objects.create(user = username,product = i.product,quantity = i.quantity)
                 guest_user.delete()
             return redirect('/manage_account')
        else: 
            messages.error(request,'Invalid username or password')
            choices      =   Category.objects.all()
            return render(request,'customer/signin.html',{'form':form, 'choices':choices})
    else: 
        if request.session.get('name'):
            del request.session['name']
            form    = Customer()
            messages.error(request,'You have been logged out')
        else:
            session_key = request.session.session_key
            cartcount   = OrderItem.objects.filter(guest_user = session_key).count()
                
        return render(request,'customer/signin.html',{'form':form, 'choices':choices,'cartcount':cartcount })
    

    
# ========================================================================================================================================= 
# user sign in view


@never_cache
def register_USer_View(request):
    choices =   Category.objects.all()
    form    = Customer()
    session_key = request.session.session_key
    cartcount   = OrderItem.objects.filter(guest_user = session_key).count()
    context     = {'form':form, 'choices':choices,'cartcount':cartcount}
    return render (request,'customer/register.html',context)


 
# ========================================================================================================================================= 
def cart_View(request): 

    choices        =   Category.objects.all()
    if  request.session.get('name'): 
        user       = request.session.get('name')
        customer   = Usercreation.objects.get(username = user)
        cartcount  =  OrderItem.objects.filter(user = customer).count()
        items      = OrderItem.objects.filter( user = customer)
        sum        = 0
        qty        =  0
        for i in items:
            sum += i.quantity  * i.product.get_coupen_offer_prize 
            qty  = i.quantity     
      
    else:
        sum  = 0
        qty  = 0
        session = request.session.session_key   
        items = OrderItem.objects.filter(guest_user =session )
        for i in items:
            sum += i.quantity  * i.product.get_coupen_offer_prize 
            qty = i.quantity 
        cartcount =OrderItem.objects.filter(guest_user =session ).count()
    contex = {'items':items, 'choices':choices,'cartcount':cartcount ,'sum':sum,'qty':qty}
    return render (request,'customer/cart.html', contex)

 
 
# ========================================================================================================================================= 

@never_cache
def checkout_view(request):
    if request.session.get('name'):         
        coupen_offer               =  0
        sum                        =  0 
        choices                    = Category.objects.all()
        user                       = request.session.get('name')
        username                   = Usercreation.objects.get(username = user)
        Items                      = OrderItem.objects.filter(user = username)
        form                       = CustomerAdress.objects.filter(user = username) 
        cartcount                  =  OrderItem.objects.filter(user = username  ).count()
    try:
        if request.method == 'GET':
            coupen    = request.GET['coupen']
            if  Coupen.objects.filter(Coupencode = coupen).exists():
                if Usercreation.objects.filter(username = user,coupen = coupen).exists():
                    messages.error(request,'This coupen you have been already used')
                else:
                    print('Not existing')
                    tax              = 18   
                    coupen_code      = Coupen.objects.get(Coupencode = coupen)
                    coupen_offer     = coupen_code.Coupen_offer  
                    user             = request.session.get('name')   
                   
                    print('first step finished')
                    for i in Items:
                        sum += i.quantity  * i.product.get_coupen_offer_prize
                    tax = int(sum/18)
                    grandtotal       = tax+sum+40
                    grandtotal       = grandtotal - (grandtotal*coupen_offer)/100
                    Usercreation.objects.filter(username = username ).update(coupen = coupen)
                    grandtotalmul = grandtotal *100

                    
                    
                      
            else:
                messages.error(request,'Invalid coupen code')
              
            context = {'Items':Items,'form':form,'tax':tax,
            'grandtotal':grandtotal,'choices':choices,'cartcount':cartcount,
            'coupen_offer':coupen_offer,'grandtotalmul':grandtotalmul,
            'sum':sum}    
            return render(request,'customer/checkout.html',context)    
           
    except:
       pass
    if  request.session.get('name'): 
        sum = 0
        for i in Items:
                sum += i.quantity  * i.product.get_coupen_offer_prize
        tax = int(sum/18)
        grandtotal = tax+sum+40
        grandtotalmul = grandtotal
    else:
         messages.error(request,'Please login for checkout ')
         return redirect ('/signin')
    grandtotalmul = grandtotal 
    contex = {'Items':Items,'choices':choices,'form':form,'tax':tax,'grandtotal':grandtotal,'cartcount': cartcount,'sum':sum,'grandtotalmul':grandtotalmul}  
    return render(request,'customer/checkout.html',contex)







 
#=================================================================================================================================== 

@csrf_protect
def updateItem(request):
    if request.session.get('name'): 
        data       = json.loads(request.body)    
        productId  = data['productId']
        action     = data['action']
    
        customer    = request.session.get('name')
        user        = Usercreation.objects.get(username = customer)
        product     = Product.objects.get(id = productId  ) 
        OrderItem.objects.create(product = product ,user = user )  
        return JsonResponse('item was added', safe = False)    
    else:
        data       = json.loads(request.body) 
        productId  = data['productId']
        if request.session.session_key: 
            session_key = request.session.session_key
            product     = Product.objects.get(id = productId  ) 
            OrderItem.objects.create(guest_user = session_key,product = product)
            print('helooooo')
            return JsonResponse('item was added', safe = False)   
        else:
            request.session.create()
            session_key = request.session.session_key
            product     = Product.objects.get(id = productId  ) 
            OrderItem.objects.create(guest_user = session_key,product = product)    
            return JsonResponse('item was added', safe = False)   
        
# ========================================================================================================================================= 


@csrf_protect
def place_orderView(request):
    customer = request.user
    data     = json.loads(request.body) 
    action   = data['action']
    if action == 'cod':
            print('This is cash on delevery')
            
            user       = OrderItem.objects.get_or_create(Customer = customer,complete =  False)
            delverycod =  OrderItem.objects.all()
            # return render (request,'customer/index.html')
            print(delverycod)
            print(user)
            for i in OrderItem:
                pass

            # delverycod = Order.objects.create(complete =  False)
            # delverycod.append(Order) 
            # order.delete()  
       

    return JsonResponse('success', safe = False)  


def Process_orderView(request):
    data   = json.loads(request.body)
    action = data['action']
    return JsonResponse('something haapened', safe = False) 

#=============================================================================================================    
       
@csrf_protect
@never_cache
def OrderView(request,id):
    if request.session.get('name'):
        coupen_offer               =  0
        discount_prize             =  0 
        choices         = Category.objects.all()
        user          = request.session.get('name')
        username      = Usercreation.objects.get(username = user)
    try: 
        if request.method == 'GET':
            coupen    = request.GET['coupen']  
            print(coupen)
            if  Coupen.objects.filter(Coupencode = coupen).exists():
                if Usercreation.objects.filter(username = user,coupen = coupen).exists():
                    messages.error(request,'This coupen you have been already used')
                    
                else:
                    tax              = 18   
                    coupen_code      = Coupen.objects.get(Coupencode = coupen)
                    coupen_offer     = coupen_code.Coupen_offer  
                    user             = request.session.get('name')   
                    Items            = Product.objects.filter(id = id)
                    for i  in Items:
                        total_prize  = i.get_Total_prize
                        print(total_prize)
                    tax              = int(total_prize/18)       
                    grandtotal       =  total_prize -(total_prize*coupen_offer/100)
                    username         = Usercreation.objects.get(username = user)
                    form             = CustomerAdress.objects.filter(user = username)
                    cartcount        = OrderItem.objects.filter(user = username).count()
                    Usercreation.objects.filter(username = username ).update(coupen = coupen)
                    grandtotalmul = grandtotal *100

            else:
                messages.error(request,'Invalid Coupen code')
        # client = razorpay.Client(auth=("rzp_test_yN1bLHNR0eQavW", "pupIlbxc6s8JT5qUAmGZFHTf"))
        DATA = {
            "amount": 100,
            "currency": "INR",
            "receipt": "receipt#1",
            "notes": {
                "key1": "value3",
                "key2": "value2"
            } 
                }
        # payment  = client.order.create(data=DATA)
        context = {'Items':Items,'form':form,'tax':tax,
        'grandtotal':grandtotal,'choices':choices,'cartcount':cartcount,
        'coupen_offer':coupen_offer,'discount_prize':discount_prize,'coupen_offer':coupen_offer,
        'grandtotalmul':grandtotalmul
       }   

        return render(request,'customer/checkout-2.html',context)             

                        
    except:
        pass
            # not_existing_coupen  =    "Invalid Coupen code"
            # print(not_existing_coupen) 

    if request.session.get('name'): 
        Items     = Product.objects.filter(id = id)
        form      = CustomerAdress.objects.filter(user = username)
        cartcount = OrderItem.objects.filter(user = username).count()
        for i in Items:
                tax         = int(( i.get_coupen_offer_prize)/18)
                grandtotal  = tax+i.get_coupen_offer_prize +40  
        grandtotalmul = grandtotal*100    
        context = {'Items':Items,'form':form,'tax':tax,
        'grandtotal':grandtotal,'choices':choices,'cartcount':cartcount,
        'coupen_offer':coupen_offer,'discount_prize':discount_prize,'grandtotalmul':grandtotalmul
     } 
        return render(request,'customer/checkout-2.html',context) 
    else:
        messages.error(request,'Please login for order the product')
        return redirect('/signin/')        


#=====================================================================================================================  
 
def addcartQtyView(request):
    if request.session.get('name'):
        data      = json.loads(request.body)
        action    = data['action']
        productid = data['productId']
        orderItem = OrderItem.objects.get(id  = productid)
        print(productid,'dddddddddddddddddddddddddddddddddddddddddddddddddddddd')
     
        if action == 'add':
            orderItem.quantity =(orderItem.quantity  + 1)
        elif action  == 'minus':
            orderItem.quantity =(orderItem.quantity  - 1)
            orderItem.delete()
        if productid in data:    
            orderItem = OrderItem.objects.get(id = productid)
        orderItem.save()      
        return JsonResponse('success', safe = False) 
    else:
        if request.session.session_key:
            data       = json.loads(request.body)
            action     = data['action'] 
            productId  = data['productId']
            orderItem  = OrderItem.objects.get(id  = productId )
            if action == 'add':
                orderItem.quantity =(orderItem.quantity  + 1)
            elif action  == 'minus':
                orderItem.quantity =(orderItem.quantity  - 1)
                orderItem.delete()
            orderItem.save()      
            return JsonResponse('success', safe = False) 
                
           
        

#==========================================================================================================================
@never_cache
def checkingaddressview(request):
    if request.session.get('name'):
    #     user1 = request.session.get('name')
    #     user   = Usercreation.objects.get( username = user1) 
    #     print(user,'/////////////////////////////////////////////////////')
    #     first_name   =  request.POST['first_name']
    #     last_name    = 	request.POST['last_name']
    #     email    	 =  request.POST['email']
    #     phone_number =	request.POST['phone_number']
    #     house_name   = 	request.POST['house_name']
    #     street_name  =	request.POST['street_name'] 
    #     city         =  request.POST['city']
    #     state	     =  request.POST['state']
    #     country	     =  request.POST['country']
    #     post_code    =  request.POST['post_code']
    #     print(email)  
    #     # address =CustomerAdress(request.POST or None)
    #     CustomerAdress.objects.create(user = user ,first_name = first_name,last_name = last_name,
    #     email = email,phone_number = phone_number,house_name = house_name
    #    ,street_name  = street_name,city = city,state = state,country = country,
    #     post_code = post_code )
    #     form = CustomerAdress.objects.filter(user = user) 
    #     # print(form,'pppppppppppppppppppppppppppppppppppppppp')
    #     # Buyorder = Product.objects.filter(id = id)
    #     # print(Buyorder,'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj')
    #     # context = {'Buyorder':Buyorder}
        return render(request,'customer/checkout-2.html') 

# ========================================================================================================================================= 

def productpage_View(request,id):
    if request.session.get('name'):
        user      = request.session.get('name')
        username  = Usercreation.objects.get(username = user)
        cartcount =  OrderItem.objects.filter(user = username).count()       
        product   = Category.objects.get(id = id)
        products  = Product.objects.filter(category_type = product)
        choices   = Category.objects.all()
        context   = {'products':products,'choices':choices,'cartcount':cartcount}
        return render (request,'customer/products.html',context) 
       
    else:
        session_key = request.session.session_key
        cartcount   = OrderItem.objects.filter(guest_user = session_key).count()      
        product    = Category.objects.get(id = id)
        products   = Product.objects.filter(category_type = product)
        choices    = Category.objects.all()
        context    = {'products':products,'choices':choices,'cartcount':cartcount}
        return render (request,'customer/products.html',context) 



# ========================================================================================================================================= 

@csrf_protect
def order_placingView(request):
    
    if request.session.get('name'):
         data           = json.loads(request.body)
         payment_method = data['payment']
         address_id     = data['address']
         product_Id     = data['productId'] 
         get_total      = data['get_total'] 
         user           = request.session.get('name')
         username       = Usercreation.objects.get(username= user)
         product        = Product.objects.get(id = product_Id)
         address        = CustomerAdress.objects.get(id = address_id ) 
         Order.objects.create( Customer = address,order_product =product,
         user_name = username,payment_method = payment_method ,total_prize =get_total)
         return JsonResponse('cash on delery', safe = False) 
   
 # =========================================================================================================================================        

def user_account_View(request):
    form = Customer()
    choices =Category.objects.all()
    if request.session.get('name'):
        user        =  request.session.get('name')
        username    =  Usercreation.objects.get(username  = user)
        order_all   =  Order.objects.filter(user_name = username).count()
        orders      =  Order.objects.filter(user_name = username).order_by('-status')
        cancel_all  = Order.objects.filter (user_name =  username,status = 'Canceled').count()
        return_all  = Order.objects.filter (user_name =  username,status = 'Return').count()
        cartcount   =  OrderItem.objects.filter(user = username).count()
    
    else:
        messages.error(request,'Please login for see your account')
        return redirect('/signin') 
        
        
    contex      = {'order_all':order_all,'orders':orders,'cartcount':cartcount,'choices':choices,'user': user,'cancel_all':cancel_all,'return_all':return_all}  
    return render(request,'customer/user_account.html' ,contex)
# ========================================================================================================================================= 
     
def cart_item_buy_View(request):
     if request.session.get('name'):
         data  = json.loads(request.body)
         payment_method = data['payment']
         address_id     = data['address']
         product_Id     = data['productId'] 
         get_total      = data['get_total']
         user           = request.session.get('name') 
         username       = Usercreation.objects.get(username= user)
         product        = OrderItem.objects.filter(user = username)
         address        = CustomerAdress.objects.get(id = address_id)
         limit = 0
         tax = 0
         for i in product:
             tax       =  i.product.product_prize/18   
             get_total =    (i.product.product_prize+tax +40) *i.quantity 
             quantity  = i.quantity 
             print(get_total,"quantity")
             Order( Customer = address, order_product  =i.product,
             user_name = username,payment_method = payment_method,
             quantity  = i.quantity ,total_prize =get_total).save()
             limit +=0
             product.delete()
         return JsonResponse({'cash-on-delevery for cart items':8, 'limi': limit} ,safe=False)



# ========================================================================================================================================= 

@never_cache
def add_new_address_View(request):
    form  = CustomerAdressForm()
    if request.method == 'POST':
        user1        = request.session.get('name')
        user         = Usercreation.objects.get( username = user1) 
        first_name   =  request.POST['first_name']
        last_name    = 	request.POST['last_name']
        phone_number =	request.POST['phone_number']
        house_name   = 	request.POST['house_name']
        street_name  =	request.POST['street_name'] 
        city         =  request.POST['city']
        state	     =  request.POST['state']
        country	     =  request.POST['country']
        post_code    =  request.POST['post_code']

        CustomerAdress.objects.create(user = user ,first_name = first_name,last_name = last_name
        ,phone_number = phone_number,house_name = house_name
        ,street_name  = street_name,city = city,state = state,country = country,
            post_code = post_code )
        Items         = OrderItem.objects.filter(user = user)
        form          = CustomerAdress.objects.filter(user = user)
        sum           = 0

        for i in Items:
            sum        += i.quantity  * i.product.product_prize
            tax         = int(sum/18)
            grandtotal  = tax+sum+40

        context = {'Items':Items,'form':form,'grandtotal':grandtotal,'tax':tax}  
        return render (request,'customer/checkout.html', context)  

    if request.session.get('name'):
        context  = {'form':form}
        return render (request,'customer/Add_address.html',context)



# ========================================================================================================================================= 

@never_cache
def add_new_addresforEachOrder_View(request,id):
    form            = CustomerAdressForm() 
    if request.session.get('name'):
        product_id  = Product.objects.filter(id = id)
        context     = {'form':form,'product_id':product_id} 
        return render (request,'customer/Add_address-2.html',context)


# ========================================================================================================================================= 

@never_cache
def newaddress_save_view(request,id):
     choices = Category.objects.all()
     if request.method == 'POST':
        user1        = request.session.get('name')
        user         = Usercreation.objects.get( username = user1) 
        first_name   =  request.POST['first_name']
        last_name    = 	request.POST['last_name']
        phone_number =	request.POST['phone_number']
        house_name   = 	request.POST['house_name']
        street_name  =	request.POST['street_name'] 
        city         =  request.POST['city']
        state	     =  request.POST['state']
        country	     =  request.POST['country']
        post_code    =  request.POST['post_code']  

        CustomerAdress.objects.create(user = user ,first_name = first_name,last_name = last_name
        ,phone_number = phone_number,house_name = house_name
        ,street_name  = street_name,city = city,state = state,country = country,
            post_code = post_code )

        cartcount  = OrderItem.objects.filter(user = user).count()
        Items      = Product.objects.filter(id = id)
        form       = CustomerAdress.objects.filter(user = user)
        for i in Items:
            tax     = int(( i.product_prize)/18)
            grandtotal = tax+i.product_prize +40 
        context = {'Items':Items,'form':form,'tax':tax,
        'grandtotal':grandtotal,'choices':choices,'cartcount':cartcount} 
        return render (request,'customer/checkout-2.html', context)

# ========================================================================================================================================= 

def my_profile_view(request):
    choices =Category.objects.all()
    if request.session.get('name'):
        user     = request.session.get('name')
        print(user)
        form     = Usercreation.objects.filter(username = user)
        username = Usercreation.objects.get(username = user)
        address  = CustomerAdress.objects.filter(user =username)
        context  = {'form':form,'address':address,'choices':choices}
        print(address)
        return render(request,'customer/User_profile.html',context)


# ========================================================================================================================================= 

def delete_address_View(request,id):
     choices    = Category.objects.all()
     if request.session.get('name'):
        user    = request.session.get('name')
        delete_address = CustomerAdress.objects.get(id = id)
        delete_address.delete()
        username  = Usercreation.objects.get(username = user)
        form      = Usercreation.objects.filter(username = user)
        username  = Usercreation.objects.get(username = user)
        address   = CustomerAdress.objects.filter(user =username).order_by('-id')
        cartcount =  OrderItem.objects.filter(user = username).count()
        context   = {'form':form,'address':address,'choices':choices}
        print(address)
        return redirect('/my_profile')
     else:
         return redirect('/')

 
# ========================================================================================================================================= 


def add_new_addressfor_userProfile_View(request):
    choices =Category.objects.all()
    form  = CustomerAdressForm() 
    if request.method == 'POST':
        user1 = request.session.get('name')
        user   = Usercreation.objects.get( username = user1) 
        first_name   =  request.POST['first_name']
        last_name    = 	request.POST['last_name']
        phone_number =	request.POST['phone_number']
        house_name   = 	request.POST['house_name']
        street_name  =	request.POST['street_name'] 
        city         =  request.POST['city']
        state	     =  request.POST['state']
        country	     =  request.POST['country']
        post_code    =  request.POST['post_code'] 
        CustomerAdress.objects.create(user = user ,first_name = first_name,last_name = last_name
        ,phone_number = phone_number,house_name = house_name
        ,street_name  = street_name,city = city,state = state,country = country,
            post_code = post_code )
        return redirect('my_profile')

    if request.session.get('name'):
            context = {'form':form} 
            return render (request,'customer/Add_address-3.html',context)
 
    else:
        return redirect('/')
# ========================================================================================================================================= 


def cancel_order_view(request,id):
        if request.session.get('name'):
            choices =Category.objects.all()
            user = request.session.get('name')
            username = Usercreation.objects.get(username = user)
            cancel_or_return = Order.objects.get(id = id)
            if cancel_or_return.status =='Processing' or  cancel_or_return.status == 'Packed': 
                cancel_or_return.status ='Canceled'
                cancel_or_return.save()
            elif cancel_or_return.status == 'Delivered':
                cancel_or_return.status  = 'Return'
                cancel_or_return.save()
            order_all   =  Order.objects.filter(user_name = username).count()
            orders      =  Order.objects.filter(user_name = username).order_by('-id')
            cartcount   =  OrderItem.objects.filter(user = username).count()
            return_all  = Order.objects.filter (user_name =  username,status = 'Return').count()
            cancel_all  = Order.objects.filter (user_name =  username,status = 'Canceled').count()
            contex = {'order_all':order_all,'orders':orders,'cartcount':cartcount,
            'choices':choices,'user': user,'cancel_all':cancel_all,'return_all':return_all} 
            return redirect('/manage_account')

        else:
            return redirect('/')


             
def editprofile_View(request):
    choices =Category.objects.all()
    if request.method  == 'POST':
        user = request.session.get('name')
        user = Usercreation.objects.get(username = user)
        editedform =  Customer(request.POST,instance  = user )
        print('form is get')
        if editedform.is_valid():
            editedform.save() 
            user        = request.session.get('name')
            form        = Usercreation.objects.filter(username = user)
            username    = Usercreation.objects.get(username = user)
            address     =    CustomerAdress.objects.filter(user =username)
            context     = {'form':form,'address':address,'choices':choices}
            return render (request,'customer/User_profile.html',context)
        else:
            print(editedform.errors)
    
    if request.session.get('name'):
        user            = request.session.get('name')
        username        = Usercreation.objects.get(username = user)
        update_form     = Customer(instance  =  username)
        context         = {'update_form':update_form}
        return render(request,'customer/edit_profile.html',context)

    else:
        return redirect('/')

#================================================================================================================================

def tracking_order_View(request,id):
    if request.session.get('name'):
        dt = datetime.now()
        td = timedelta(days=4)
        est_date_delvery = dt + td
        delveried = datetime.now()

        track_order = Order.objects.filter(id = id)
        for i in track_order:
            if i.status == 'Delivered':
                delveried = datetime.now()
            else:  
                dt = datetime.now()
                td = timedelta(days=4)
                est_date_delvery = dt + td
        context     = {'track_order':track_order,'est_date_delvery':est_date_delvery,'delveried':delveried}

    return render(request,'customer/track_order.html',context) 

# =======================================================================================================================     

@csrf_protect
def coupen_check_view(request):
    if request.session.get('name'):
        data          = json.loads(request.body)    
        coupen        = data['coupen']
        user          = request.session.get('name')
        username      = Usercreation.objects.get(username  = user)
        print(coupen)
        coupen_check  = Coupen.objects.all() 
        if  Coupen.objects.filter(Coupencode = coupen).exists():
            return JsonResponse('item was added', safe = False)   

    else:
        return redirect ('/')       
# ======================================================================================================================================


def mywishlist_view(request):
    if request.session.get('name'):
        user = request.session.get('name')
        username = Usercreation.objects.get(username = user)
        wishlist = MyWishList.objects.filter(username = username)
        context  = {'wishlist':wishlist}
        return render(request,'customer/wishlist.html',context)


# ======================================================================================================================================  

@csrf_protect
def add_to_wishlist_view(request):
      if request.session.get('name'): 
        data       = json.loads(request.body)    
        productId  = data['productId']
        action     = data['action']
        customer    = request.session.get('name')
        user        = Usercreation.objects.get(username = customer)
        product     = Product.objects.get(id = productId  ) 
        MyWishList.objects.create(product = product ,username = user )
        return JsonResponse('item was added', safe = False)   
#=========================================================================================================================================
def delete_wish_list_view(request,id):
    if request.session.get('name'):
        delete_wishlist = MyWishList.objects.get(id = id)
        delete_wishlist.delete()
        return redirect('my_wishlist')

# =========================================================================================================================================        
def remove_cart_item_View(request,id):
    if request.session.get('name'):
        remove_cart_item  = OrderItem.objects.get(id = id)
        remove_cart_item.delete()
        return redirect('/cart')
    else:   
        remove_cart_item  = OrderItem.objects.get(id = id)
        remove_cart_item.delete()
        return redirect('/cart') 
        

#========================================================================================================================================= 
def invoice_view(request,id):     
    if request.session.get('name'):
        product = Product.objects.get(id = id)
        order= Order.objects.filter(order_product = product ).order_by('-id')
 
        context = {'order':order}
        return render(request,'customer/invoice.html',context)
#=========================================================================================================================================



def invoice_Cart_view(request):     
    if request.session.get('name'):
        order   = Order.objects.all()
        context = {'order':order}
        return render(request,'customer/invoice.html',context)


#=========================================================================================================================================


def razorpay_checkout(request):
    if request.session.get("name"):
        if request.method == 'GET':
            user        = request.session.get('name')
            payment     = request.GET['payment']
            product_id  = request.GET['product']
            username    = Usercreation.objects.get(username = user)
            product     = Product.objects.get(id = product_id)
            get_total   =  request.GET['grandtotal']
            address     =  request.GET['address']
            address     = CustomerAdress.objects.get(id = address)
            print(user,payment,product_id ,username,address,get_total,'b;ahhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh')
            Order.objects.create( Customer = address,order_product =product,
         user_name = username,payment_method = payment ,total_prize =get_total)
            print('successsssssssssssssssssssssssssssssssssssssssss')
            order= Order.objects.all().order_by('-id')
            context = {'order':order}
        return render(request,'customer/invoice.html',context)
            


#=========================================================================================================================================

            

def razorpay_cart_checkout(request):
    if request.session.get("name"):
        if request.method == 'GET':
            user        = request.session.get('name')
            payment     = request.GET['payment']
            username       = Usercreation.objects.get(username= user)
            product        = OrderItem.objects.filter(user = username)
            get_total   =  request.GET['grandtotal']
            address     =  request.GET['address']
            address     = CustomerAdress.objects.get(id = address)
            for i in product:
                tax       =  i.product.product_prize/18   
                get_total =    (i.product.product_prize+tax +40) *i.quantity 
                quantity  = i.quantity 
                print(get_total,"quantity")
                Order( Customer = address, order_product  =i.product,
                user_name = username,payment_method = payment,
                quantity  = i.quantity ,total_prize =get_total).save()
                product.delete()
            print('succuss')
            order= Order.objects.all().order_by('-id')
            context = {'order':order}
            return render(request,'customer/invoice.html',context)
                  
#=========================================================================================================================================
def edit_address_view(request,id):
    if request.session.get('name'):
        user    = request.session.get('name')
        if request.method == 'POST':
            pass
        else:
            username        = Usercreation.objects.get(username = user)
            address         = CustomerAdress.objects.get(id  = id)
            form            = CustomerAdressForm(instance  =  address)
            context          =   {'form':form}    
            return render (request,'customer/Editaddress.html',context)
    else:

        return redirect("signin")        
def edti_address_save_View(request):
    if request.session.get('name'):
        user    = request.session.get('name')
        if request.method == 'POST':
            user = request.session.get('name')
            user = Usercreation.objects.get(username = user)

            user = CustomerAdress.objects.get(user = user)
            editedform =  CustomerAdressForm(request.POST,instance  = user )
            if editedform.is_valid():
                editedform.save()
            return redirect('/my_profile')

            
    else:
        return redirect("signin")          

def login_with_otp(request):
    return render (request,'customer/login_with_otp_mob.html')


def sending_otp_view(request):
        if request.method == "POST":
            print('hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii')
            try:
                print('helllllllllllllllllllllllll0')
                number = request.POST['number']
               
                number = int(number)
                
                num = Usercreation.objects.filter(phone_number = number).count()
               
                if num >= 1:
                    number = str(number)
                    num = '+91'+number
                    if SendOTP(num):
                        print('blhaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
                        return  render(request,'customer/login_otp.html',{'number':number})
                       
                else:
                    messages.error(request,"we could'nt find your number from our server")
                    return render (request,'customer/login_with_otp_mob.html')        
            except:
                pass           
                
        messages.error(request,"Temporarly otp not working")
        return render (request,'customer/login_with_otp_mob.html')           
               
def otp_login_verification(request):
    try:
        if request.method == "POST":
            otp = request.POST['otp']
            num = request.POST['number']
            number = str(num)
            number = '+91'+num
            print('was it ')
            print(number,'////////////////////////////')
            if check(otp,number):
                print(num)
                user  = Usercreation.objects.get(phone_number = num)
               
                username  = user.username
                print(user,'//rrrrrrrrrrroooooooooooooooooooooooooooosa')
                request.session['name'] = username
                return redirect('/manage_account')

            else:
                messages.error(request,'Invalid OTP')
                return  render(request,'customer/login_otp.html',{'number':number})
        else:
            return redirect('/signin')  
    except:
           messages.error(request,'Invalid OTP')
           return  render(request,'customer/login_otp.html',{'number':number})



# this function just was for finding the error for when user login with otp  and also set timer 
def timercheck(request):
    number = 7012598205
    user  = Usercreation.objects.filter(phone_number = number)
    for i in user:
        username = i.username
        print(i.username,'balhhhhhhhhhhhhhhhhhhhhh')
    request.session['name'] = username
    print(username)
    return render (request,'customer/otp.html')        




# @never_cache
# def add_to_cart(request, pk):
#     if request.session.has_key('user'):
#         user = request.session['user']
#         newuser = CustomUser.objects.get(username=user)
#         product_id = Products.objects.get(pk=pk)
#         Cart_details(user=newuser, products=product_id,
#                      sub_total=product_id.discounted_price, quantity=1).save()
#         cart = Cart_details.objects.filter(user=newuser)
#         wishlist.objects.filter(user=newuser,wishlist_products=product_id).delete()
#         return redirect('show_cart')
#     else:
#         product_id = Products.objects.get(pk=pk)
#         if not request.session.session_key:
#             request.session.create()
#         session_key = request.session.session_key
#         Cart_details(guest_user=session_key, products=product_id,
#                      sub_total=product_id.discounted_price, quantity=1).save()
#         cart = Cart_details.objects.filter(guest_user=session_key)
#         wishlist.objects.filter(guest_user=session_key,wishlist_products=product_id).delete()
#         return redirect('show_cart')