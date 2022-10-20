<template>
    <div>
        <main>
        <!--Start Shop Details Breadcrumb-->
        <div class="shop-details-breadcrumb wow fadeInUp animated overflow-hidden ">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="shop-details-inner">
                            <ul class="shop-details-menu">
                                <li><a href="index.html">Home</a></li>
                                <li class="active">Shop Details</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End Shop Details Breadcrumb-->
        <!--Start Shop Details Top-->
        <section v-if="product" class="shop-details-top two ">
            <div class="container">
                <div class="row mt--30">
                    <div v-if="product.product_images" class="col-xl-6 col-lg-6 mt-30 wow fadeInUp animated">
                        <div  class="single-product-box one">
                            <div class="big-product single-product-one slider-for">
                                <div v-for="image in product.product_images" v-bind:key="image.id">
                                    <div class="single-item"> <img :src="image.url" alt="">
                                        <div class="ptag"> <span class="one">-20% </span> </div> 
                                        <a v-if="getToken()" @click.prevent="likeProduct()" href="#0" 
                                            v-bind:class="[product.like == true ? 'love-active' : 'love']">
                                            <i class="flaticon-like"></i> 
                                        </a>
                                        <router-link v-else :to="{name: 'user.login'}" class="love">
                                            <i class="flaticon-like"></i>
                                        </router-link>
                                    </div>
                                </div>
                            </div>
                            <div class="navholder">
                                <div class="product-slicknav single-product-one-nav slider-nav">
                                    <div v-for="image in product.product_images" v-bind:key="image.id"> 
                                        <span class="single-item"><img :src="image.url" alt=""></span>          
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 mt-30 wow fadeInUp animated">
                        <div class="shop-details-top-right ">
                            <div class="shop-details-top-right-content-box">
                                <div class="shop-details-top-review-box">
                                    <div class="shop-details-top-review">
                                        <div class="stars-outer">
                                            <div class="stars-inner" :style="{width: percentRatingStar() + '%'}"></div>
                                        </div>
                                        <p>({{ product.count_rating }} Reviews)</p>
                                    </div>
                                </div>
                                <div class="shop-details-top-title">
                                    <h3>{{ product.title }}</h3>
                                </div>
                                <ul class="shop-details-top-info">
                                    <li><span>SKU:</span> {{ product.id }}</li>
                                </ul>
                                <div class="shop-details-top-price-box">
                                    <!--<h3>100<del >50</del></h3>-->
                                    <h3>${{ product.price }}<del v-if="product.old_price">{{ product.old_price }}</del></h3>
                                </div>
                                <ul class="shop-details-top-category-tags">
                                    <li>Brand: <span>{{ product.brand.title }}</span></li>
                                    <li>Sex: <span>{{ product.sex.title }}</span></li>
                                </ul>
                                <br>
                                <p class="shop-details-top-product-sale"><span>20</span> Products sold in last 12 hours
                                </p>
                                <div class="shop-details-top-size-box">
                                    <h4>Size: <span v-if="countOfSizeObj">({{ countOfSizeObj.title }})</span></h4>
                                    <div class="shop-details-top-size-list-box">
                                        <ul class="shop-details-top-size-list">
                                            <li v-for="countSize in product.counts" v-bind:key="countSize.id">
                                                <a @click.prevent="setProductSize(countSize)" href="#0">{{ countSize.title }}</a>
                                            </li>
                                        </ul>
                                        <p class="shop-details-top-size-guide"><a href="#popupSizeInfo" class="popup_link">Size Guide</a></p>
                                    </div>
                                </div>
                                <div class="shop-details-top-color-sky-box">
                                    <h4>Color: (Sky Blue)</h4>
                                    <ul class="varients">
                                        <li> <a href="#0" class="shop-details-top-color-sky-img"
                                                data-src="/assets/images/shop/products-img1.jpg"> <img
                                                    src="/assets/images/shop/shop-details-top-color-sky-img-1.jpg"
                                                    alt=""> </a> </li>
                                        <li> <a href="#0" class="shop-details-top-color-sky-img"
                                                data-src="/assets/images/shop/products-img2.jpg"> <img
                                                    src="/assets/images/shop/shop-details-top-color-sky-img-2.jpg"
                                                    alt=""> </a> </li>
                                        <li> <a href="#0" class="shop-details-top-color-sky-img"
                                                data-src="/assets/images/shop/products-img3.jpg"> <img
                                                    src="/assets/images/shop/shop-details-top-color-sky-img-3.jpg"
                                                    alt=""> </a> </li>
                                        <li> <a href="#0" class="shop-details-top-color-sky-img"
                                                data-src="/assets/images/shop/products-img4.jpg"> <img
                                                    src="/assets/images/shop/shop-details-top-color-sky-img-4.jpg"
                                                    alt=""> </a> </li>
                                    </ul>
                                </div>
                                <ul class="shop-details-top-ask-question">
                                    <li> <a href="#0" @click.prevent="addToCompare(product)">
                                            <div class="icon"> <i class="flaticon-left-and-right-arrows"></i> </div>
                                            <div class="text">
                                                <p>Add to Compare</p>
                                            </div>
                                        </a> 
                                    </li>
                                </ul>
                                <p v-if="product.count_likes > 0" class="shop-details-top-product-sale">
                                    <span>{{ this.product.count_likes }}</span> Persons looking for this product
                                </p>
                                <div class="product-quantity">
                                    <h4>Quantity</h4>
                                    <div class="product-quantity-box d-flex align-items-center flex-wrap">
                                        <div class="qty mr-2">
                                            <div class="qtySelector text-center"> 
                                                <span class="decreaseQty" ><i class="flaticon-minus"></i></span>
                                                <input type="number" class="qtyValue" value="1" /> 
                                                <span class="increaseQty" :maxValue="maxCountSize"> <i class="flaticon-plus"></i> </span> 
                                            </div>
                                        </div>
                                        <div class="product-quantity-check"> <i class="flaticon-select"></i>
                                            <p>In Stock</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="shop-details-top-order-now"> <i class="flaticon-point"></i>
                                    <p v-if="countOfSizeObj">Order Now, Only {{ countOfSizeObj.count }} Left !</p>
                                    <p v-else>Choose size</p>
                                </div>
                                <div v-if="countOfSizeObj" class="shop-details-top-cart-box-btn"> 
                                    <button @click.prevent = "addToCart(product, countOfSizeObj)" class="btn--primary style2 " 
                                        type="submit">Add to Cart</button> 
                                </div>
                                <div v-else class="shop-details-top-cart-box-btn"> 
                                    <button @click.prevent = "" class="btn--primary style2 " 
                                        type="submit">Add to Cart</button> 
                                </div>
                                <p class="shop-details-top-product-delivery">This product estimated delivery between
                                    <span>Wednesday 27 October</span> <br> <span>Tuesday 02 November</span></p>
                                <ul class="shop-details-top-category-tags">
                                    <li>Category: <span>{{ product.category.title }}</span></li>
                                    <li>Tags: <span>{{ tags }}</span></li>
                                    <li>Material: <span>{{ materials }}</span></li>
                                    <li>Season: <span>{{ seasons }}</span></li>
                                     <li>Country: <span>{{ product.country.title }}</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End Shop Details Top-->
<!--PopupSizeInfo-->
        <div id="popupSizeInfo" class="product-gird__quick-view-popup mfp-hide">
            <div class="container">
                <div class="row justify-content-between align-items-center">
                    <div class="size-chirt">
                            <h4>Size Guide</h4>
                            <p class="pt-0"> Assertively conceptualize parallel process improvements through
                                user friendly colighue to action items. </p>
                            <div class="size-tabble">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Size</th>
                                            <th>XXS - XS</th>
                                            <th>XS - S</th>
                                            <th>S - M</th>
                                            <th>M - L</th>
                                            <th>L - XL</th>
                                            <th>XL - XXL</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>ARGENTINA</td>
                                            <td>7</td>
                                            <td>8</td>
                                            <td>9</td>
                                            <td>10</td>
                                            <td>11</td>
                                            <td>12</td>
                                        </tr>
                                        <tr>
                                            <td>BOLIVIA</td>
                                            <td>8</td>
                                            <td>9</td>
                                            <td>10</td>
                                            <td>11</td>
                                            <td>12</td>
                                            <td>13</td>
                                        </tr>
                                        <tr>
                                            <td>COLOMBIA</td>
                                            <td>26</td>
                                            <td>28</td>
                                            <td>30</td>
                                            <td>32</td>
                                            <td>34</td>
                                            <td>36</td>
                                        </tr>
                                        <tr>
                                            <td>China</td>
                                            <td>34</td>
                                            <td>36</td>
                                            <td>38</td>
                                            <td>40</td>
                                            <td>42</td>
                                            <td>44</td>
                                        </tr>
                                        <tr>
                                            <td>MEXICO</td>
                                            <td>32</td>
                                            <td>34</td>
                                            <td>36</td>
                                            <td>38</td>
                                            <td>40</td>
                                            <td>42</td>
                                        </tr>
                                        <tr>
                                            <td>JAMAICA</td>
                                            <td>40</td>
                                            <td>42</td>
                                            <td>44</td>
                                            <td>46</td>
                                            <td>48</td>
                                            <td>50</td>
                                        </tr>
                                        <tr>
                                            <td>MEXICO</td>
                                            <td>32</td>
                                            <td>34</td>
                                            <td>36</td>
                                            <td>38</td>
                                            <td>40</td>
                                            <td>42</td>
                                        </tr>
                                        <tr>
                                            <td>Australia</td>
                                            <td>6</td>
                                            <td>8</td>
                                            <td>10</td>
                                            <td>12</td>
                                            <td>14</td>
                                            <td>16</td>
                                        </tr>
                                        <tr>
                                            <td>USA</td>
                                            <td>33</td>
                                            <td>44</td>
                                            <td>55</td>
                                            <td>66</td>
                                            <td>77</td>
                                            <td>88</td>
                                        </tr>
                                        <tr>
                                            <td>UK</td>
                                            <td>6</td>
                                            <td>8</td>
                                            <td>10</td>
                                            <td>12</td>
                                            <td>14</td>
                                            <td>16</td>
                                        </tr>
                                        <tr>
                                            <td><strong>Pant</strong></td>
                                            <td>22-23 </td>
                                            <td>24-25</td>
                                            <td>26-27</td>
                                            <td>28-29</td>
                                            <td>30-31</td>
                                            <td>32-33</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>                                                                                                           
        </div>
    </div>
</div>
<!--EndPopupSizeInfo-->
        <!-- productdrescription-tabStart -->
<section v-if="product" class="product pt-60 pb-60 wow fadeInUp overflow-hidden ">
    <div class="container">
        <div class="row wow fadeInUp animated">
            <div class="col-12">
                <ul class="nav product-details-nav nav-one nav-pills justify-content-center" id="pills-tab-two"
                    role="tablist">
                    <li class="nav-item" role="presentation"> <button class="nav-link active"
                            id="pills-description-tab" data-bs-toggle="pill" data-bs-target="#pills-description"
                            type="button" role="tab" aria-controls="pills-description" aria-selected="true">
                            Description </button> </li>
                    <li class="nav-item" role="presentation"> <button class="nav-link" id="pills-additional-tab"
                            data-bs-toggle="pill" data-bs-target="#pills-additional" type="button" role="tab"
                            aria-controls="pills-additional" aria-selected="false"> Additional </button> </li>
                    <li class="nav-item" role="presentation"> <button class="nav-link" id="pills-review-tab"
                            data-bs-toggle="pill" data-bs-target="#pills-review" type="button" role="tab"
                            aria-controls="pills-review" aria-selected="false"> Review </button> </li>
                </ul>
            </div>
        </div>
        <div class="row wow fadeInUp animated">
            <div class="tab-content" id="pills-tabContent-two">
                <div class="tab-pane fade show active" id="pills-description" role="tabpanel"
                    aria-labelledby="pills-description-tab">
                    <div class="product-drescription">
                        <h4> Product Details:</h4>
                        <p>{{ product.description }}</p>
                    </div>
                </div>
                <div class="tab-pane fade" id="pills-additional" role="tabpanel"
                    aria-labelledby="pills-additional-tab">
                    <div class="product-drescription">
                        <p class="pt-0" v-html="product.content"></p>
                    </div>
                </div>
                <div class="tab-pane fade" id="pills-review" role="tabpanel" aria-labelledby="pills-review-tab">
                    <div class="product-drescription">
                        <div class="head_review" this.value>
                            <div class="review-single__my pt-0 hed">
                                <div class="ratting"> 
                                    <div class="stars-outer">
                                        <div class="stars-inner" :style="{width: percentRatingStar() + '%'}"></div>
                                    </div>
                                    <span class="ps-1">({{ Number.isInteger(product.rating) ? product.rating + '.0' : product.rating }})</span>
                                    <span class="ps-2">BASED ON {{ product.count_rating }} REVIEW</span> 
                                </div>
                            </div>
                            <a v-if="getToken()" @click.prevent="feedbackProductNull();setFeedbackId(null)" href="#popupReview" class="btn--primary style2 popup_link">
                                Написать отзыв
                            </a>
                            <router-link v-else :to="{name: 'user.login'}" class="btn--primary style2">
                                Написать отзыв
                            </router-link>            
                        </div>
                        <div id="popupReview" class="product-gird__quick-view-popup mfp-hide" style="width:50%">
                            <div class="container">
                                <div class="row justify-content-between align-items-center">
                                    <div class="col-lg-12">
                                        <div class="product-drescription">
                                            <div class="review-from-box mt-30">
                                                <h6 v-if="feedbackParentId">Write a Reply</h6>
                                                <h6 v-else>Write a Review</h6>
                                                <form action="#" class="review-from">
                                                    <div class="row">
                                                        <div v-if="feedbackParentId == null" class="col-lg-12">
                                                            <div class="ratting-box">
                                                                <p> RATING </p>
                                                                <div class="star-choose" @mouseout="fixStars()">
                                                                    <template v-for="item in 5" :key="`star${item}`">
                                                                        <div :class="[changeRating[item-1] == true ? 'icon-star-like' : 'icon-star']" 
                                                                            @mousemove="focusRating(item)" @click="clickRating(item)"></div>
                                                                    </template>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-group m-0"> 
                                                                <label v-if="feedbackParentId" for="email">BODY OF REPLY (1500)</label> 
                                                                <label v-else for="email">BODY OF REVIEW (1500)</label> 
                                                                <textarea v-model="textFeedback" placeholder="Write Your Comments Here"></textarea> 
                                                            </div>
                                                        </div>
                                                    </div> 
                                                    <button v-if="textFeedback !== ''" type="submit" @click.prevent="feedbackProduct()" class="mfp-close btn--primary style2">
                                                        Submit {{ feedbackParentId ? 'Reply' : 'Review' }}   
                                                    </button>
                                                    <button v-else type="submit" @click.prevent="" class="btn--primary style2">
                                                        Submit {{ feedbackParentId ? 'Reply' : 'Review' }}   
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div v-for="feedback in product.feedback" :key="feedback.id">
                            <div class="review-single">
                                <div class="left">
                                    <h6>{{ feedback.user }} <span> {{ feedback.date }}</span> </h6>
                                    <div class="ratting">
                                        <template v-for="item in 5" :key="`star${item}`">
                                            <i :class="[item <= feedback.rating ? 'flaticon-star-1' : 'flaticon-star']"></i>
                                        </template>
                                        <i class="flaticon-star-grey"></i>
                                    </div>
                                    <p>{{ feedback.message }}</p>
                                </div> 
                                <a v-if="getToken()" @click.prevent="feedbackProductNull();setFeedbackId(feedback.id)" href="#popupReview" class="right-box popup_link">
                                    Написать ответ
                                </a>
                                <router-link v-else :to="{name: 'user.login'}" class="right-box">
                                    Написать ответ
                                </router-link>
                            </div>
                            <div v-if="feedback.reply.length > 0" class="reply">
                                <div v-for="replyFeedback in feedback.reply" :key="`reply${replyFeedback.id}`" class="review-single-reply">
                                    <div class="left">
                                        <h6>{{ replyFeedback.user }} <span> {{ replyFeedback.date }}</span> </h6>
                                        <p>{{ replyFeedback.message }}</p>
                                    </div> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section> <!-- productdrescription-tab End -->
<!-- recent-products Start -->

<section v-if ="recentProducts.length > 0" class="recent-products pt-60 pb-120 overflow-hidden wow fadeInUp">
    <div class="container ">
        <div class="row">
            <div class="col-12 wow fadeInUp animated">
                <div class="section-head text-center">
                    <h2>Recent Products </h2>
                </div>
            </div>
        </div>
        <div class="row mt-30 wow fadeInUp animated">
            <div class="catagory-slider">
                <div v-for="recentProduct in recentProducts" v-bind:key="recentProduct.id" class="products-grid-one">
                    <div class="products-grid-one__product-image">
                        <router-link :to="{name: 'product.show', params: {id: recentProduct.id}}" class="d-block products-grid__image_holder"> 
                            <img :src="recentProduct.image_url" class="products-grid-one__mainimage products-grid-one__first-img" alt="" /> 
                            <img :src="recentProduct.image_url" class="products-grid-one__hover-img" alt="" />
                        </router-link>
                        <div class="products-grid__usefull-links">
                            <ul>
                                <li>
                                    <a v-if="getToken()" @click.prevent="likeRecentProduct(recentProduct.id)" href="#0">
                                        <i v-if="recentProduct.like == true" class="fas fa-heart"></i> 
                                        <i v-else class="flaticon-heart"></i> 
                                        <span>wishlist</span>
                                    </a>
                                    <router-link v-else :to="{name: 'user.login'}">
                                        <i class="flaticon-heart"></i>
                                    </router-link>
                                </li>
                                <li>
                                    <a @click.prevent="addToCompare(recentProduct)" href="#0"> 
                                        <i class="flaticon-left-and-right-arrows"></i>
                                        <span>compare</span> 
                                    </a> 
                                </li>
                                <li>
                                    <a @click.prevent="popupProductNull();getRecentProduct(recentProduct.id)" :href="`#popup${recentProduct.id}`" class="popup_link"> 
                                        <i class="flaticon-visibility"></i>
                                        <span> quick view</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div :id="`popup${recentProduct.id}`" class="product-gird__quick-view-popup mfp-hide">
                        <div v-if="popupProduct" class="container">
                            <div class="row justify-content-between align-items-center">
                                <div class="col-lg-6">
                                    <div class="quick-view__left-content">
                                        <div class="tabs">
                                            <div class="popup-product-thumb-box">
                                                <ul>
                                                    <li v-for="productImage in popupProduct.product_images" v-bind:key="productImage.id"
                                                        class="tab-nav popup-product-thumb">
                                                        <a :href="`#tabb${productImage.id}`">
                                                            <img :src="productImage.url" alt="" /> 
                                                        </a> 
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="popup-product-main-image-box">
                                                <div v-for="productImage in popupProduct.product_images" v-bind:key="productImage.id"
                                                    :id="`tabb${productImage.id}`"
                                                    class="tab-item popup-product-image">
                                                    <div class="popup-product-single-image">
                                                        <img :src="productImage.url" alt="" /> 
                                                    </div>
                                                </div>
                                                <button class="prev"> <i class="flaticon-back"></i></button> 
                                                <button class="next"> <i class="flaticon-next"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="popup-right-content">
                                        <h3>{{ popupProduct.title }}</h3>
                                        <div class="ratting">
                                            <div class="stars-outer">
                                                <div class="stars-inner" :style="{width: percentRatingPopupStar() + '%'}"></div>
                                            </div> 
                                            <span>({{ popupProduct.count_rating }})</span> 
                                        </div>
                                        <p class="text"> {{ popupProduct.description }} </p>
                                        <div class="price">
                                            <h2> {{ popupProduct.price }} <del v-if="popupProduct.old_price"> {{ popupProduct.old_price }}</del></h2>
                                            <h6> In stuck</h6>
                                        </div>
                                        <div class="color-varient"> 
                                            <h6>Color</h6>
                                            <template v-for="color in popupProduct.colors" v-bind:key="color.id">
                                                <div class="d-inline-block mr-0.25" :style="`background: #${color.title}; width:20px; height:20px; margin-right:10px`"></div>
                                            </template> 
                                        </div>
                                        <div class="color-varient"> 
                                            <h6>Similar products</h6>
                                            <template v-for="groupProduct in popupProduct.group_products" v-bind:key="groupProduct.id">
                                                <a @click.prevent="getRecentProduct(groupProduct.id)" href="#0" class="color-name" style="background: none"> 
                                                    <img :src="groupProduct.image_url" alt=""> 
                                                    <span>{{ groupProduct.title }}</span>
                                                </a>
                                            </template> 
                                        </div>
                                        <!--size-->
                                        <div class="shop-details-top-size-box">
                                            <h4>Size: <span v-if="countOfSizeObjPopup">({{ countOfSizeObjPopup.title }})</span></h4>
                                            <div class="shop-details-top-size-list-box">
                                                <ul class="shop-details-top-size-list">
                                                    <li v-for="countOfSize in popupProduct.counts" v-bind:key="countOfSize.id">
                                                        <a @click.prevent="setProductSizePopup(countOfSize)" href="#0">{{ countOfSize.title }}</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!--endsize-->
                                        <div class="add-product">
                                            <h6>Qty:</h6>
                                            <div class="button-group">
                                                <div class="qtySelector text-center">
                                                    <span class="decreaseQty"><i class="flaticon-minus"></i></span>
                                                    <input type="number" class="qtyValue" value="1" />
                                                    <span class="increaseQty" :maxValue="maxCountSizePopup"> <i class="flaticon-plus"></i></span>
                                                </div>
                                                <button v-if="countOfSizeObjPopup" @click.prevent = "addToCart(popupProduct, countOfSizeObjPopup)" class="btn--primary mfp-close"> Add to Cart </button>
                                                <button v-else @click.prevent = "" class="btn--primary"> Add to Cart </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div :id="`popupForSize${recentProduct.id}`" class="product-gird__quick-view-popup mfp-hide" style="width:50%">
                        <div v-if="popupProduct" class="container">
                            <div class="row justify-content-between align-items-center">
                                <div class="col-lg-12">
                                    <div class="popup-right-content">
                                        <h3>{{ popupProduct.title }}</h3>
                                        <!--size-->
                                        <div class="shop-details-top-size-box">
                                            <h4>Size: <span v-if="countOfSizeObjPopup">({{ countOfSizeObjPopup.title }})</span></h4>
                                            <div class="shop-details-top-size-list-box">
                                                <ul class="shop-details-top-size-list">
                                                    <li v-for="countOfSize in popupProduct.counts" v-bind:key="countOfSize.id">
                                                        <a @click.prevent="setProductSizePopup(countOfSize)" href="#0">{{ countOfSize.title }}</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!--endsize-->
                                        <div class="add-product">
                                            <h6>Qty:</h6>
                                            <div class="button-group">
                                                <div class="qtySelector text-center">
                                                    <span class="decreaseQty"><i class="flaticon-minus"></i></span>
                                                    <input type="number" class="qtyValue" value="1" />
                                                    <span class="increaseQty" :maxValue="maxCountSizePopup"> <i class="flaticon-plus"></i></span>
                                                </div>
                                                <button v-if="countOfSizeObjPopup" @click.prevent = "addToCart(popupProduct, countOfSizeObjPopup)" class="btn--primary mfp-close"> Add to Cart </button>
                                                <button v-else @click.prevent = "" class="btn--primary"> Add to Cart </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="products-grid__content"> 
                        <a @click.prevent="popupProductNull();getRecentProduct(recentProduct.id)" :href="`#popupForSize${recentProduct.id}`"
                                class="products-grid__cart-btn btn--primary popup_link"> 
                            <span class="one"> Add to Cart </span>
                            <span class="two"> <i class="flaticon-shopping-cart"> </i> </span> 
                        </a>
                        <div class="ratting"> 
                            <div class="stars-outer">
                                <div class="stars-inner" :style="{width: percentRatingRecentStar(recentProduct) + '%'}"></div>
                            </div> 
                        </div>
                        <h5 class="product_name">
                            <router-link :to="{name: 'product.show', params: {id: recentProduct.id}}">
                                {{ recentProduct.title }}
                            </router-link>
                        </h5>
                        <div class="price d-flex align-content-center justify-content-center">
                            <p><del v-if="recentProduct.old_price"> {{ recentProduct.old_price }}</del> {{ recentProduct.price }}</p> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
   
    </main>
    </div>
</template>

<script>
export default {
    name: "Show",
    mounted(){
        //$(document).trigger('changed_')
        this.getProduct()
        this.getRecentProducts()
    },
    data() {
        return {
            product: null,
            recentProducts: [],
            materials: null,
            seasons: null,
            tags: null,
            maxCountSize: 1,
            countOfSizeObj: null,
            rating: null,
            changeRating: [false,false,false,false,false],
            chooseRating: [false,false,false,false,false],
            textFeedback: '',
            feedbackParentId: null,
            popupProduct: null,
            countOfSizeObjPopup: null, //object size of popupProduct
            maxCountSizePopup: null //max count of size popupProduct
        }
    },
    methods: {
        focusRating(itemStar){
            let i;
            for(i = 0; i < itemStar; i++){
                this.changeRating[i] = true;
            }
            for(i = itemStar; i < 5; i++){
                this.changeRating[i] = false;
            }
        },
        clickRating(itemStar){
            this.chooseRating = this.changeRating.slice(0);
            this.rating = itemStar;
        },
        fixStars(){
            this.changeRating = this.chooseRating.slice(0);
        },
        getProduct(){
            this.axios.get(`/api/product/${this.$route.params.id}`)
                .then(res => {
                    console.log(res.data.data);
                    this.product = res.data.data;
                    this.materials = this.getProductDataToString(this.product.materials);
                    this.seasons = this.getProductDataToString(this.product.seasons);
                    this.tags = this.getProductDataToString(this.product.tags);
                    console.log(res);
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
            this.$emit('set-search-empty');    
        },
        getProductDataToString(arrayObjectData){
            if (arrayObjectData !== null){
                let arrayData = [];
                arrayObjectData.forEach((el,i) => {
                    arrayData[i] = el.title;
                });
                let stringData = arrayData.join();
                stringData = stringData.replaceAll(',', ', ');
            return stringData;
            }
            else{
                return '';
            }
        },
        setProductSize(countOfSize){
            this.countOfSizeObj = countOfSize;
            this.maxCountSize = this.countOfSizeObj.count;
            console.log(this.countOfSizeObj);
            console.log("count - " + this.countOfSizeObj.count);
            var el = document.querySelector(".qtyValue");
            el.value = 1;
        },
        addToCart(product, countOfSizeObj){
            let qty = Number($('.qtyValue').val());
            let cart = localStorage.getItem('cart');
            $('.qtyValue').val(1); 
            let newProduct = [
                    {
                        'id': product.id,
                        'title': product.title,
                        'price': product.price,
                        'image_url': product.image_url,
                        'size_id': countOfSizeObj.id,
                        'size_title': countOfSizeObj.title,
                        'qty': qty
                    }
                ];

            if(!cart){
                localStorage.setItem('cart', JSON.stringify(newProduct));
            }else{
                cart = JSON.parse(cart);
                cart.forEach(productInCart => {
                    if((productInCart.id === product.id) && (productInCart.size_id === countOfSizeObj.id)){
                        productInCart.qty = Number(productInCart.qty) + Number(qty);
                        newProduct = null;
                    }
                });

                Array.prototype.push.apply(cart, newProduct);
                localStorage.setItem('cart', JSON.stringify(cart));
                this.$emit('get-cart-products')
            }
            
        },
        addToCompare(product){
            let compare = localStorage.getItem('compare');
            let compareProduct = [
                    {
                        'id': product.id,
                        'category_id': product.category.id,
                        'category_title': product.category.title,
                        'title': product.title
                    }
                ];
            if(!compare){
                localStorage.setItem('compare', JSON.stringify(compareProduct));
            }else{
                compare = JSON.parse(compare);
                compare.forEach((productInCompare, index, arr) => {
                    if(productInCompare.id === product.id){
                        compareProduct = null;
                        arr.splice(index,1);
                    }
                });
                Array.prototype.push.apply(compare, compareProduct);
                localStorage.setItem('compare', JSON.stringify(compare));
                this.$emit('get-compare-products');
            }
        },
        likeProduct(){
            this.axios.get(`/api/product/${this.$route.params.id}/like`)
                .then(res => {
                    let likeInfo = res.data.data;
                    this.product.count_likes = likeInfo.count_likes;
                    this.product.like = likeInfo.like;
                    console.log(res.data.data);
                    console.log(this.product);
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
        },
        likeRecentProduct(id){
            this.axios.get(`/api/product/${id}/like`)
                .then(res => {
                    let likeInfo = res.data.data;
                    this.recentProducts.forEach(el => {
                        if(el.id === id){
                            el.count_likes = likeInfo.count_likes;
                            el.like = likeInfo.like;
                        }
                    })
                })
                .finally(x => {
                    $(document).trigger('changed_')
            });
        },
        feedbackProduct(){
            this.axios.post(`/api/product/${this.$route.params.id}/feedback`,{
                message: this.textFeedback,
                rating: this.rating,
                status: 'new',
                parent_id: this.feedbackParentId
            })
                .then(res => {
                    console.log("OK");
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
        },
        feedbackProductNull(){
            this.textFeedback = '';
            this.rating = null;
            this.chooseRating = [false, false, false, false, false];
            this.changeRating = [false, false, false, false, false];
        },
        getToken(){
            return localStorage.getItem('x_xsrf_token');
        },
        percentRatingStar(){
            return Math.round((this.product.rating / 5) * 100);
        },
        percentRatingPopupStar(){
            return Math.round((this.popupProduct.rating / 5) * 100);
        },
        percentRatingRecentStar(recentProduct){
            return Math.round((recentProduct.rating / 5) * 100);
        },
        setFeedbackId(feedbackParentId){
            this.feedbackParentId = feedbackParentId;
        },

        getRecentProducts(){
            this.axios.get(`/api/products/recent/${this.$route.params.id}`)
                .then(res => {
                    this.recentProducts = res.data.data;
                    console.log('this.recentProducts');
                    console.log(this.recentProducts);
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
        },
        popupProductNull(){
            this.popupProduct = null;
            this.countOfSizeObjPopup = null;
            this.maxCountSizePopup = 1;
        },
        getRecentProduct(id){
            this.axios.get(`/api/product/${id}`)
                .then(res => {
                    this.popupProduct = res.data.data;
                    console.log(res.data.data);
                })
                .finally(x => {
                    $(document).trigger('changed_')
                });
        },
        setProductSizePopup(countOfSize){
            this.countOfSizeObjPopup = countOfSize;
            this.maxCountSizePopup = this.countOfSizeObjPopup.count;
            console.log(this.countOfSizeObjPopup);
            console.log("count - " + this.countOfSizeObjPopup.count);
            var el = document.querySelector(".qtyValue");
            el.value = 1;
        }
        /*
        getProduct(){
            const reqProduct = this.axios.get(`/api/product/${this.$route.params.id}`);
            const reqRecentProducts = this.axios.get(`/api/products/recent/${this.$route.params.id}`);
            this.axios
                .all([reqProduct, reqRecentProducts])
                .then(
                    axios.spread((...res) => {
                        const resProduct = res[0];
                        const resRecentProducts = res[1];
                        this.product = resProduct.data.data;
                        this.materials = this.getProductDataToString(this.product.materials);
                        this.seasons = this.getProductDataToString(this.product.seasons);
                        this.tags = this.getProductDataToString(this.product.tags);
                        
                        this.recentProducts = resRecentProducts.data.data;
                    })
                )
                .finally(x => {
                    $(document).trigger('changed_')
                });     
        },
        */
    }
}
</script>

<style scoped>
    .head_review{
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .stars-outer{
        position: relative;
        display: inline-block;
    }
    .stars-inner{
        position: absolute;
        top:0;
        left:0;
        white-space: nowrap;
        overflow: hidden;
        width:0;
    }
    .stars-inner::before{
        content: "\f005 \f005 \f005 \f005 \f005";
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        color: #f69c63;
    }
    .stars-outer::before{
        content: "\f005 \f005 \f005 \f005 \f005";
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        color: #ccc;
    }
    .icon-star, .icon-star-like{
        display:inline-block;
        padding-right:5px;
    }
    .icon-star::before, .icon-star-like::before{
        content: "\f005";
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        font-size: 20px;
    }
    .icon-star::before{
        color: #ccc;
    }
    .icon-star-like::before{
        color: #f69c63;
    }
    .star-choose{
        display:block;
        float:left;
    }
    .review-single{
        border: 1px solid #EBE9E9;
        padding:10px;
        margin-bottom:15px;
        border-radius:10px;
    }
    .review-single-reply{
        border: 1px solid #EBE9E9;
        padding:10px;
        margin-bottom:15px;
        margin-left:30px;
        border-radius:10px;
    }
    .reply{
        border-left: 1px solid #EBE9E9;
    }
    .review-single-reply h6 {
        padding-top: 6px;
        font-weight: 600;
    }
    .review-single-reply h6 span {
        display: block;
        font-size: 14px;
        padding-top: 3px;
    }
    .head_review{
        margin-bottom:20px
    }
    .flaticon-star::before{
        color: #ccc;
    }
    .mfp-close{
        opacity: 1;
        border: 1px solid black;
        width: 170px;
    }

</style>