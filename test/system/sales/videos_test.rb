require "application_system_test_case"

class Sales::VideosTest < ApplicationSystemTestCase
  setup do
    @sales_video = sales_videos(:one)
  end

  test "visiting the index" do
    visit sales_videos_url
    assert_selector "h1", text: "Videos"
  end

  test "should create video" do
    visit sales_videos_url
    click_on "New video"

    fill_in "Descricao", with: @sales_video.descricao
    fill_in "Link", with: @sales_video.link
    fill_in "Nome", with: @sales_video.nome
    fill_in "Sales courses", with: @sales_video.sales_courses_id
    click_on "Create Video"

    assert_text "Video was successfully created"
    click_on "Back"
  end

  test "should update Video" do
    visit sales_video_url(@sales_video)
    click_on "Edit this video", match: :first

    fill_in "Descricao", with: @sales_video.descricao
    fill_in "Link", with: @sales_video.link
    fill_in "Nome", with: @sales_video.nome
    fill_in "Sales courses", with: @sales_video.sales_courses_id
    click_on "Update Video"

    assert_text "Video was successfully updated"
    click_on "Back"
  end

  test "should destroy Video" do
    visit sales_video_url(@sales_video)
    click_on "Destroy this video", match: :first

    assert_text "Video was successfully destroyed"
  end
end
