  require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count', 0) do
      post products_url, params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, tiitle: @product.tiitle } }
    end

    assert_difference('Product.count') do
            post :create, product: {
                    :description => 'Some new book',
                    :image_url => 'some_img.jpg',
                    :price => 59.99,
                    :title => 'Some new title'
            } 
        end
    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, tiitle: @product.tiitle } }
    assert_response 200
        @product = products(:two)
        patch :update, id: @product, product: {
            :description => @product.description,
            :image_url => @product.image_url,
            :price => @product.price,
            :title => @product.title
        } 
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
