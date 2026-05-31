delete from tb_f_account
delete from tb_f_language
delete from tb_f_personal_homepage
delete from tb_f_work_location
delete from tb_f_education
delete from tb_f_residence
delete from tb_f_group_manage WHERE case_id<>0 AND userid<>0
delete from tb_f_groupmember
delete from tb_f_invite_add_group
delete from tb_f_my_friends
delete from tb_f_friends_apply
delete from tb_f_public_homepage
delete from tb_f_public_homepage_fans
delete from tb_f_post_manage
delete from tb_f_post_likes
delete from tb_f_post_comment
delete from tb_f_post_quick_push
delete from tb_f_payment_method																																																		
delete from tb_f_post_quick_push_audience
delete from tb_f_snapshot
delete from tb_f_activity
delete from tb_f_activity_personnel
delete from tb_f_ad_manage_tool
delete from tb_f_ad_recharge
delete from tb_f_CaseKeyWords WHERE UserId<>0
delete from tb_f_Achievement
delete from tb_f_data_review
delete from tb_training_report_review


DELETE FROM tb_i_account WHERE id<>3
DELETE FROM tb_i_post WHERE UserId<>0
DELETE FROM tb_i_interest
DELETE FROM tb_i_speciality_account
DELETE FROM tb_i_bind_fb_account
DELETE FROM tb_i_post_quick_push
DELETE FROM tb_i_payment_method
DELETE FROM tb_i_post_quick_push_audience
DELETE FROM tb_i_post_likes






DELETE FROM tb_t_account WHERE id<>1
DELETE FROM tb_t_language
DELETE FROM tb_t_fans
DELETE FROM tb_t_post WHERE UserId<>0 AND caseid<>0
DELETE FROM tb_t_post_like
DELETE FROM tb_t_post_comment
DELETE FROM tb_t_ad_account
DELETE FROM tb_t_ad_language
DELETE FROM tb_t_promotion
DELETE FROM tb_t_payment_method
DELETE FROM tb_t_payment_record
DELETE FROM tb_t_rule_manage