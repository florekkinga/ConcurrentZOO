pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__concurrent_zoo.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__concurrent_zoo.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E074 : Short_Integer; pragma Import (Ada, E074, "system__os_lib_E");
   E010 : Short_Integer; pragma Import (Ada, E010, "ada__exceptions_E");
   E015 : Short_Integer; pragma Import (Ada, E015, "system__soft_links_E");
   E027 : Short_Integer; pragma Import (Ada, E027, "system__exception_table_E");
   E042 : Short_Integer; pragma Import (Ada, E042, "ada__containers_E");
   E070 : Short_Integer; pragma Import (Ada, E070, "ada__io_exceptions_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "ada__strings_E");
   E056 : Short_Integer; pragma Import (Ada, E056, "ada__strings__maps_E");
   E060 : Short_Integer; pragma Import (Ada, E060, "ada__strings__maps__constants_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "interfaces__c_E");
   E029 : Short_Integer; pragma Import (Ada, E029, "system__exceptions_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "system__object_reader_E");
   E049 : Short_Integer; pragma Import (Ada, E049, "system__dwarf_lines_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__soft_links__initialize_E");
   E041 : Short_Integer; pragma Import (Ada, E041, "system__traceback__symbolic_E");
   E420 : Short_Integer; pragma Import (Ada, E420, "ada__numerics_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "ada__tags_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "ada__streams_E");
   E201 : Short_Integer; pragma Import (Ada, E201, "gnat_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "interfaces__c__strings_E");
   E180 : Short_Integer; pragma Import (Ada, E180, "system__file_control_block_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "system__finalization_root_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "ada__finalization_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "system__file_io_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "system__storage_pools_E");
   E150 : Short_Integer; pragma Import (Ada, E150, "system__finalization_masters_E");
   E148 : Short_Integer; pragma Import (Ada, E148, "system__storage_pools__subpools_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "ada__strings__unbounded_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "system__task_info_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__calendar_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__calendar__delays_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "ada__real_time_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "ada__text_io_E");
   E464 : Short_Integer; pragma Import (Ada, E464, "system__assertions_E");
   E188 : Short_Integer; pragma Import (Ada, E188, "system__pool_global_E");
   E444 : Short_Integer; pragma Import (Ada, E444, "system__pool_size_E");
   E435 : Short_Integer; pragma Import (Ada, E435, "gnat__sockets_E");
   E440 : Short_Integer; pragma Import (Ada, E440, "gnat__sockets__thin_common_E");
   E438 : Short_Integer; pragma Import (Ada, E438, "gnat__sockets__thin_E");
   E403 : Short_Integer; pragma Import (Ada, E403, "system__tasking__initialization_E");
   E413 : Short_Integer; pragma Import (Ada, E413, "system__tasking__protected_objects_E");
   E415 : Short_Integer; pragma Import (Ada, E415, "system__tasking__protected_objects__entries_E");
   E411 : Short_Integer; pragma Import (Ada, E411, "system__tasking__queuing_E");
   E536 : Short_Integer; pragma Import (Ada, E536, "system__tasking__stages_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "glib_E");
   E186 : Short_Integer; pragma Import (Ada, E186, "gtkada__types_E");
   E264 : Short_Integer; pragma Import (Ada, E264, "gdk__frame_timings_E");
   E212 : Short_Integer; pragma Import (Ada, E212, "glib__glist_E");
   E248 : Short_Integer; pragma Import (Ada, E248, "gdk__visual_E");
   E214 : Short_Integer; pragma Import (Ada, E214, "glib__gslist_E");
   E429 : Short_Integer; pragma Import (Ada, E429, "glib__poll_E");
   E480 : Short_Integer; pragma Import (Ada, E480, "glib__wrappers_E");
   E206 : Short_Integer; pragma Import (Ada, E206, "gtkada__c_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "glib__object_E");
   E198 : Short_Integer; pragma Import (Ada, E198, "glib__type_conversion_hooks_E");
   E208 : Short_Integer; pragma Import (Ada, E208, "glib__types_E");
   E210 : Short_Integer; pragma Import (Ada, E210, "glib__values_E");
   E200 : Short_Integer; pragma Import (Ada, E200, "gtkada__bindings_E");
   E216 : Short_Integer; pragma Import (Ada, E216, "cairo_E");
   E218 : Short_Integer; pragma Import (Ada, E218, "cairo__region_E");
   E220 : Short_Integer; pragma Import (Ada, E220, "gdk__rectangle_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "glib__generic_properties_E");
   E256 : Short_Integer; pragma Import (Ada, E256, "gdk__color_E");
   E419 : Short_Integer; pragma Import (Ada, E419, "gdk__color__ihls_E");
   E238 : Short_Integer; pragma Import (Ada, E238, "gdk__rgba_E");
   E192 : Short_Integer; pragma Import (Ada, E192, "gdk__event_E");
   E355 : Short_Integer; pragma Import (Ada, E355, "glib__key_file_E");
   E226 : Short_Integer; pragma Import (Ada, E226, "glib__properties_E");
   E490 : Short_Integer; pragma Import (Ada, E490, "glib__properties__creation_E");
   E431 : Short_Integer; pragma Import (Ada, E431, "glib__spawn_E");
   E427 : Short_Integer; pragma Import (Ada, E427, "glib__main_E");
   E315 : Short_Integer; pragma Import (Ada, E315, "glib__string_E");
   E313 : Short_Integer; pragma Import (Ada, E313, "glib__variant_E");
   E311 : Short_Integer; pragma Import (Ada, E311, "glib__g_icon_E");
   E387 : Short_Integer; pragma Import (Ada, E387, "gtk__actionable_E");
   E230 : Short_Integer; pragma Import (Ada, E230, "gtk__builder_E");
   E228 : Short_Integer; pragma Import (Ada, E228, "gtk__buildable_E");
   E329 : Short_Integer; pragma Import (Ada, E329, "gtk__cell_area_context_E");
   E345 : Short_Integer; pragma Import (Ada, E345, "gtk__css_section_E");
   E250 : Short_Integer; pragma Import (Ada, E250, "gtk__enums_E");
   E369 : Short_Integer; pragma Import (Ada, E369, "gtk__orientable_E");
   E357 : Short_Integer; pragma Import (Ada, E357, "gtk__paper_size_E");
   E353 : Short_Integer; pragma Import (Ada, E353, "gtk__page_setup_E");
   E365 : Short_Integer; pragma Import (Ada, E365, "gtk__print_settings_E");
   E502 : Short_Integer; pragma Import (Ada, E502, "gtk__stock_E");
   E276 : Short_Integer; pragma Import (Ada, E276, "gtk__target_entry_E");
   E274 : Short_Integer; pragma Import (Ada, E274, "gtk__target_list_E");
   E508 : Short_Integer; pragma Import (Ada, E508, "gtk__text_mark_E");
   E281 : Short_Integer; pragma Import (Ada, E281, "pango__enums_E");
   E299 : Short_Integer; pragma Import (Ada, E299, "pango__attributes_E");
   E285 : Short_Integer; pragma Import (Ada, E285, "pango__font_metrics_E");
   E287 : Short_Integer; pragma Import (Ada, E287, "pango__language_E");
   E283 : Short_Integer; pragma Import (Ada, E283, "pango__font_E");
   E373 : Short_Integer; pragma Import (Ada, E373, "gtk__text_attributes_E");
   E375 : Short_Integer; pragma Import (Ada, E375, "gtk__text_tag_E");
   E291 : Short_Integer; pragma Import (Ada, E291, "pango__font_face_E");
   E289 : Short_Integer; pragma Import (Ada, E289, "pango__font_family_E");
   E293 : Short_Integer; pragma Import (Ada, E293, "pango__fontset_E");
   E295 : Short_Integer; pragma Import (Ada, E295, "pango__matrix_E");
   E279 : Short_Integer; pragma Import (Ada, E279, "pango__context_E");
   E361 : Short_Integer; pragma Import (Ada, E361, "pango__font_map_E");
   E301 : Short_Integer; pragma Import (Ada, E301, "pango__tabs_E");
   E297 : Short_Integer; pragma Import (Ada, E297, "pango__layout_E");
   E359 : Short_Integer; pragma Import (Ada, E359, "gtk__print_context_E");
   E246 : Short_Integer; pragma Import (Ada, E246, "gdk__display_E");
   E262 : Short_Integer; pragma Import (Ada, E262, "gdk__frame_clock_E");
   E266 : Short_Integer; pragma Import (Ada, E266, "gdk__pixbuf_E");
   E244 : Short_Integer; pragma Import (Ada, E244, "gdk__screen_E");
   E258 : Short_Integer; pragma Import (Ada, E258, "gdk__device_E");
   E260 : Short_Integer; pragma Import (Ada, E260, "gdk__drag_contexts_E");
   E305 : Short_Integer; pragma Import (Ada, E305, "gdk__window_E");
   E268 : Short_Integer; pragma Import (Ada, E268, "gtk__accel_group_E");
   E317 : Short_Integer; pragma Import (Ada, E317, "gtk__adjustment_E");
   E319 : Short_Integer; pragma Import (Ada, E319, "gtk__cell_editable_E");
   E321 : Short_Integer; pragma Import (Ada, E321, "gtk__editable_E");
   E323 : Short_Integer; pragma Import (Ada, E323, "gtk__entry_buffer_E");
   E341 : Short_Integer; pragma Import (Ada, E341, "gtk__icon_source_E");
   E363 : Short_Integer; pragma Import (Ada, E363, "gtk__print_operation_preview_E");
   E270 : Short_Integer; pragma Import (Ada, E270, "gtk__selection_data_E");
   E272 : Short_Integer; pragma Import (Ada, E272, "gtk__style_E");
   E371 : Short_Integer; pragma Import (Ada, E371, "gtk__text_iter_E");
   E335 : Short_Integer; pragma Import (Ada, E335, "gtk__tree_model_E");
   E254 : Short_Integer; pragma Import (Ada, E254, "gtk__widget_E");
   E333 : Short_Integer; pragma Import (Ada, E333, "gtk__cell_renderer_E");
   E331 : Short_Integer; pragma Import (Ada, E331, "gtk__cell_layout_E");
   E327 : Short_Integer; pragma Import (Ada, E327, "gtk__cell_area_E");
   E234 : Short_Integer; pragma Import (Ada, E234, "gtk__container_E");
   E307 : Short_Integer; pragma Import (Ada, E307, "gtk__bin_E");
   E224 : Short_Integer; pragma Import (Ada, E224, "gtk__box_E");
   E325 : Short_Integer; pragma Import (Ada, E325, "gtk__entry_completion_E");
   E347 : Short_Integer; pragma Import (Ada, E347, "gtk__misc_E");
   E349 : Short_Integer; pragma Import (Ada, E349, "gtk__notebook_E");
   E367 : Short_Integer; pragma Import (Ada, E367, "gtk__status_bar_E");
   E252 : Short_Integer; pragma Import (Ada, E252, "gtk__style_provider_E");
   E242 : Short_Integer; pragma Import (Ada, E242, "gtk__settings_E");
   E343 : Short_Integer; pragma Import (Ada, E343, "gtk__style_context_E");
   E339 : Short_Integer; pragma Import (Ada, E339, "gtk__icon_set_E");
   E337 : Short_Integer; pragma Import (Ada, E337, "gtk__image_E");
   E309 : Short_Integer; pragma Import (Ada, E309, "gtk__gentry_E");
   E303 : Short_Integer; pragma Import (Ada, E303, "gtk__window_E");
   E240 : Short_Integer; pragma Import (Ada, E240, "gtk__dialog_E");
   E351 : Short_Integer; pragma Import (Ada, E351, "gtk__print_operation_E");
   E236 : Short_Integer; pragma Import (Ada, E236, "gtk__arguments_E");
   E474 : Short_Integer; pragma Import (Ada, E474, "gdk__cursor_E");
   E381 : Short_Integer; pragma Import (Ada, E381, "glib__menu_model_E");
   E476 : Short_Integer; pragma Import (Ada, E476, "glib__object__checked_destroy_E");
   E385 : Short_Integer; pragma Import (Ada, E385, "gtk__action_E");
   E389 : Short_Integer; pragma Import (Ada, E389, "gtk__activatable_E");
   E454 : Short_Integer; pragma Import (Ada, E454, "gtk__button_E");
   E492 : Short_Integer; pragma Import (Ada, E492, "gtk__cell_renderer_pixbuf_E");
   E460 : Short_Integer; pragma Import (Ada, E460, "gtk__clipboard_E");
   E482 : Short_Integer; pragma Import (Ada, E482, "gtk__css_provider_E");
   E526 : Short_Integer; pragma Import (Ada, E526, "gtk__grange_E");
   E484 : Short_Integer; pragma Import (Ada, E484, "gtk__icon_theme_E");
   E393 : Short_Integer; pragma Import (Ada, E393, "gtk__main_E");
   E466 : Short_Integer; pragma Import (Ada, E466, "gtk__marshallers_E");
   E383 : Short_Integer; pragma Import (Ada, E383, "gtk__menu_item_E");
   E470 : Short_Integer; pragma Import (Ada, E470, "gtk__image_menu_item_E");
   E391 : Short_Integer; pragma Import (Ada, E391, "gtk__menu_shell_E");
   E379 : Short_Integer; pragma Import (Ada, E379, "gtk__menu_E");
   E377 : Short_Integer; pragma Import (Ada, E377, "gtk__label_E");
   E516 : Short_Integer; pragma Import (Ada, E516, "gtk__scrollable_E");
   E524 : Short_Integer; pragma Import (Ada, E524, "gtk__scrollbar_E");
   E522 : Short_Integer; pragma Import (Ada, E522, "gtk__scrolled_window_E");
   E538 : Short_Integer; pragma Import (Ada, E538, "gtk__table_E");
   E506 : Short_Integer; pragma Import (Ada, E506, "gtk__text_child_anchor_E");
   E510 : Short_Integer; pragma Import (Ada, E510, "gtk__text_tag_table_E");
   E504 : Short_Integer; pragma Import (Ada, E504, "gtk__text_buffer_E");
   E528 : Short_Integer; pragma Import (Ada, E528, "gtk__text_view_E");
   E458 : Short_Integer; pragma Import (Ada, E458, "gtk__toggle_button_E");
   E456 : Short_Integer; pragma Import (Ada, E456, "gtk__check_button_E");
   E518 : Short_Integer; pragma Import (Ada, E518, "gtk__tooltip_E");
   E496 : Short_Integer; pragma Import (Ada, E496, "gtk__tree_drag_dest_E");
   E498 : Short_Integer; pragma Import (Ada, E498, "gtk__tree_drag_source_E");
   E520 : Short_Integer; pragma Import (Ada, E520, "gtk__tree_selection_E");
   E500 : Short_Integer; pragma Import (Ada, E500, "gtk__tree_sortable_E");
   E494 : Short_Integer; pragma Import (Ada, E494, "gtk__list_store_E");
   E512 : Short_Integer; pragma Import (Ada, E512, "gtk__tree_store_E");
   E468 : Short_Integer; pragma Import (Ada, E468, "gtk__tree_view_column_E");
   E514 : Short_Integer; pragma Import (Ada, E514, "gtk__tree_view_E");
   E472 : Short_Integer; pragma Import (Ada, E472, "gtk__missed_E");
   E395 : Short_Integer; pragma Import (Ada, E395, "gtk__main__router_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      declare
         procedure F1;
         pragma Import (Ada, F1, "gtk__main__router__finalize_body");
      begin
         E395 := E395 - 1;
         F1;
      end;
      declare
         procedure F2;
         pragma Import (Ada, F2, "gtk__main__router__finalize_spec");
      begin
         F2;
      end;
      E472 := E472 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "gtk__missed__finalize_spec");
      begin
         F3;
      end;
      E514 := E514 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "gtk__tree_view__finalize_spec");
      begin
         F4;
      end;
      E468 := E468 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "gtk__tree_view_column__finalize_spec");
      begin
         F5;
      end;
      E512 := E512 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "gtk__tree_store__finalize_spec");
      begin
         F6;
      end;
      E494 := E494 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "gtk__list_store__finalize_spec");
      begin
         F7;
      end;
      E520 := E520 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "gtk__tree_selection__finalize_spec");
      begin
         F8;
      end;
      E518 := E518 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "gtk__tooltip__finalize_spec");
      begin
         F9;
      end;
      E456 := E456 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "gtk__check_button__finalize_spec");
      begin
         F10;
      end;
      E458 := E458 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "gtk__toggle_button__finalize_spec");
      begin
         F11;
      end;
      E528 := E528 - 1;
      declare
         procedure F12;
         pragma Import (Ada, F12, "gtk__text_view__finalize_spec");
      begin
         F12;
      end;
      E504 := E504 - 1;
      declare
         procedure F13;
         pragma Import (Ada, F13, "gtk__text_buffer__finalize_spec");
      begin
         F13;
      end;
      E510 := E510 - 1;
      declare
         procedure F14;
         pragma Import (Ada, F14, "gtk__text_tag_table__finalize_spec");
      begin
         F14;
      end;
      E506 := E506 - 1;
      declare
         procedure F15;
         pragma Import (Ada, F15, "gtk__text_child_anchor__finalize_spec");
      begin
         F15;
      end;
      E538 := E538 - 1;
      declare
         procedure F16;
         pragma Import (Ada, F16, "gtk__table__finalize_spec");
      begin
         F16;
      end;
      E522 := E522 - 1;
      declare
         procedure F17;
         pragma Import (Ada, F17, "gtk__scrolled_window__finalize_spec");
      begin
         F17;
      end;
      E524 := E524 - 1;
      declare
         procedure F18;
         pragma Import (Ada, F18, "gtk__scrollbar__finalize_spec");
      begin
         F18;
      end;
      E377 := E377 - 1;
      declare
         procedure F19;
         pragma Import (Ada, F19, "gtk__label__finalize_spec");
      begin
         F19;
      end;
      E379 := E379 - 1;
      declare
         procedure F20;
         pragma Import (Ada, F20, "gtk__menu__finalize_spec");
      begin
         F20;
      end;
      E391 := E391 - 1;
      declare
         procedure F21;
         pragma Import (Ada, F21, "gtk__menu_shell__finalize_spec");
      begin
         F21;
      end;
      E470 := E470 - 1;
      declare
         procedure F22;
         pragma Import (Ada, F22, "gtk__image_menu_item__finalize_spec");
      begin
         F22;
      end;
      E383 := E383 - 1;
      declare
         procedure F23;
         pragma Import (Ada, F23, "gtk__menu_item__finalize_spec");
      begin
         F23;
      end;
      E484 := E484 - 1;
      declare
         procedure F24;
         pragma Import (Ada, F24, "gtk__icon_theme__finalize_spec");
      begin
         F24;
      end;
      E526 := E526 - 1;
      declare
         procedure F25;
         pragma Import (Ada, F25, "gtk__grange__finalize_spec");
      begin
         F25;
      end;
      E482 := E482 - 1;
      declare
         procedure F26;
         pragma Import (Ada, F26, "gtk__css_provider__finalize_spec");
      begin
         F26;
      end;
      E460 := E460 - 1;
      declare
         procedure F27;
         pragma Import (Ada, F27, "gtk__clipboard__finalize_spec");
      begin
         F27;
      end;
      E492 := E492 - 1;
      declare
         procedure F28;
         pragma Import (Ada, F28, "gtk__cell_renderer_pixbuf__finalize_spec");
      begin
         F28;
      end;
      E454 := E454 - 1;
      declare
         procedure F29;
         pragma Import (Ada, F29, "gtk__button__finalize_spec");
      begin
         F29;
      end;
      E385 := E385 - 1;
      declare
         procedure F30;
         pragma Import (Ada, F30, "gtk__action__finalize_spec");
      begin
         F30;
      end;
      E381 := E381 - 1;
      declare
         procedure F31;
         pragma Import (Ada, F31, "glib__menu_model__finalize_spec");
      begin
         F31;
      end;
      E303 := E303 - 1;
      E254 := E254 - 1;
      E335 := E335 - 1;
      E343 := E343 - 1;
      E272 := E272 - 1;
      E367 := E367 - 1;
      E351 := E351 - 1;
      E349 := E349 - 1;
      E309 := E309 - 1;
      E325 := E325 - 1;
      E323 := E323 - 1;
      E240 := E240 - 1;
      E234 := E234 - 1;
      E333 := E333 - 1;
      E327 := E327 - 1;
      E317 := E317 - 1;
      E268 := E268 - 1;
      E262 := E262 - 1;
      E246 := E246 - 1;
      declare
         procedure F32;
         pragma Import (Ada, F32, "gtk__print_operation__finalize_spec");
      begin
         F32;
      end;
      declare
         procedure F33;
         pragma Import (Ada, F33, "gtk__dialog__finalize_spec");
      begin
         F33;
      end;
      declare
         procedure F34;
         pragma Import (Ada, F34, "gtk__window__finalize_spec");
      begin
         F34;
      end;
      declare
         procedure F35;
         pragma Import (Ada, F35, "gtk__gentry__finalize_spec");
      begin
         F35;
      end;
      E337 := E337 - 1;
      declare
         procedure F36;
         pragma Import (Ada, F36, "gtk__image__finalize_spec");
      begin
         F36;
      end;
      E339 := E339 - 1;
      declare
         procedure F37;
         pragma Import (Ada, F37, "gtk__icon_set__finalize_spec");
      begin
         F37;
      end;
      declare
         procedure F38;
         pragma Import (Ada, F38, "gtk__style_context__finalize_spec");
      begin
         F38;
      end;
      E242 := E242 - 1;
      declare
         procedure F39;
         pragma Import (Ada, F39, "gtk__settings__finalize_spec");
      begin
         F39;
      end;
      declare
         procedure F40;
         pragma Import (Ada, F40, "gtk__status_bar__finalize_spec");
      begin
         F40;
      end;
      declare
         procedure F41;
         pragma Import (Ada, F41, "gtk__notebook__finalize_spec");
      begin
         F41;
      end;
      E347 := E347 - 1;
      declare
         procedure F42;
         pragma Import (Ada, F42, "gtk__misc__finalize_spec");
      begin
         F42;
      end;
      declare
         procedure F43;
         pragma Import (Ada, F43, "gtk__entry_completion__finalize_spec");
      begin
         F43;
      end;
      E224 := E224 - 1;
      declare
         procedure F44;
         pragma Import (Ada, F44, "gtk__box__finalize_spec");
      begin
         F44;
      end;
      E307 := E307 - 1;
      declare
         procedure F45;
         pragma Import (Ada, F45, "gtk__bin__finalize_spec");
      begin
         F45;
      end;
      declare
         procedure F46;
         pragma Import (Ada, F46, "gtk__container__finalize_spec");
      begin
         F46;
      end;
      declare
         procedure F47;
         pragma Import (Ada, F47, "gtk__cell_area__finalize_spec");
      begin
         F47;
      end;
      declare
         procedure F48;
         pragma Import (Ada, F48, "gtk__cell_renderer__finalize_spec");
      begin
         F48;
      end;
      declare
         procedure F49;
         pragma Import (Ada, F49, "gtk__widget__finalize_spec");
      begin
         F49;
      end;
      declare
         procedure F50;
         pragma Import (Ada, F50, "gtk__tree_model__finalize_spec");
      begin
         F50;
      end;
      declare
         procedure F51;
         pragma Import (Ada, F51, "gtk__style__finalize_spec");
      begin
         F51;
      end;
      E270 := E270 - 1;
      declare
         procedure F52;
         pragma Import (Ada, F52, "gtk__selection_data__finalize_spec");
      begin
         F52;
      end;
      E341 := E341 - 1;
      declare
         procedure F53;
         pragma Import (Ada, F53, "gtk__icon_source__finalize_spec");
      begin
         F53;
      end;
      declare
         procedure F54;
         pragma Import (Ada, F54, "gtk__entry_buffer__finalize_spec");
      begin
         F54;
      end;
      declare
         procedure F55;
         pragma Import (Ada, F55, "gtk__adjustment__finalize_spec");
      begin
         F55;
      end;
      declare
         procedure F56;
         pragma Import (Ada, F56, "gtk__accel_group__finalize_spec");
      begin
         F56;
      end;
      E260 := E260 - 1;
      declare
         procedure F57;
         pragma Import (Ada, F57, "gdk__drag_contexts__finalize_spec");
      begin
         F57;
      end;
      E258 := E258 - 1;
      declare
         procedure F58;
         pragma Import (Ada, F58, "gdk__device__finalize_spec");
      begin
         F58;
      end;
      E244 := E244 - 1;
      declare
         procedure F59;
         pragma Import (Ada, F59, "gdk__screen__finalize_spec");
      begin
         F59;
      end;
      E266 := E266 - 1;
      declare
         procedure F60;
         pragma Import (Ada, F60, "gdk__pixbuf__finalize_spec");
      begin
         F60;
      end;
      declare
         procedure F61;
         pragma Import (Ada, F61, "gdk__frame_clock__finalize_spec");
      begin
         F61;
      end;
      declare
         procedure F62;
         pragma Import (Ada, F62, "gdk__display__finalize_spec");
      begin
         F62;
      end;
      E359 := E359 - 1;
      declare
         procedure F63;
         pragma Import (Ada, F63, "gtk__print_context__finalize_spec");
      begin
         F63;
      end;
      E297 := E297 - 1;
      declare
         procedure F64;
         pragma Import (Ada, F64, "pango__layout__finalize_spec");
      begin
         F64;
      end;
      E301 := E301 - 1;
      declare
         procedure F65;
         pragma Import (Ada, F65, "pango__tabs__finalize_spec");
      begin
         F65;
      end;
      E361 := E361 - 1;
      declare
         procedure F66;
         pragma Import (Ada, F66, "pango__font_map__finalize_spec");
      begin
         F66;
      end;
      E279 := E279 - 1;
      declare
         procedure F67;
         pragma Import (Ada, F67, "pango__context__finalize_spec");
      begin
         F67;
      end;
      E293 := E293 - 1;
      declare
         procedure F68;
         pragma Import (Ada, F68, "pango__fontset__finalize_spec");
      begin
         F68;
      end;
      E289 := E289 - 1;
      declare
         procedure F69;
         pragma Import (Ada, F69, "pango__font_family__finalize_spec");
      begin
         F69;
      end;
      E291 := E291 - 1;
      declare
         procedure F70;
         pragma Import (Ada, F70, "pango__font_face__finalize_spec");
      begin
         F70;
      end;
      E375 := E375 - 1;
      declare
         procedure F71;
         pragma Import (Ada, F71, "gtk__text_tag__finalize_spec");
      begin
         F71;
      end;
      E283 := E283 - 1;
      declare
         procedure F72;
         pragma Import (Ada, F72, "pango__font__finalize_spec");
      begin
         F72;
      end;
      E287 := E287 - 1;
      declare
         procedure F73;
         pragma Import (Ada, F73, "pango__language__finalize_spec");
      begin
         F73;
      end;
      E285 := E285 - 1;
      declare
         procedure F74;
         pragma Import (Ada, F74, "pango__font_metrics__finalize_spec");
      begin
         F74;
      end;
      E299 := E299 - 1;
      declare
         procedure F75;
         pragma Import (Ada, F75, "pango__attributes__finalize_spec");
      begin
         F75;
      end;
      E508 := E508 - 1;
      declare
         procedure F76;
         pragma Import (Ada, F76, "gtk__text_mark__finalize_spec");
      begin
         F76;
      end;
      E274 := E274 - 1;
      declare
         procedure F77;
         pragma Import (Ada, F77, "gtk__target_list__finalize_spec");
      begin
         F77;
      end;
      E365 := E365 - 1;
      declare
         procedure F78;
         pragma Import (Ada, F78, "gtk__print_settings__finalize_spec");
      begin
         F78;
      end;
      E353 := E353 - 1;
      declare
         procedure F79;
         pragma Import (Ada, F79, "gtk__page_setup__finalize_spec");
      begin
         F79;
      end;
      E357 := E357 - 1;
      declare
         procedure F80;
         pragma Import (Ada, F80, "gtk__paper_size__finalize_spec");
      begin
         F80;
      end;
      E345 := E345 - 1;
      declare
         procedure F81;
         pragma Import (Ada, F81, "gtk__css_section__finalize_spec");
      begin
         F81;
      end;
      E329 := E329 - 1;
      declare
         procedure F82;
         pragma Import (Ada, F82, "gtk__cell_area_context__finalize_spec");
      begin
         F82;
      end;
      E230 := E230 - 1;
      declare
         procedure F83;
         pragma Import (Ada, F83, "gtk__builder__finalize_spec");
      begin
         F83;
      end;
      E313 := E313 - 1;
      declare
         procedure F84;
         pragma Import (Ada, F84, "glib__variant__finalize_spec");
      begin
         F84;
      end;
      E196 := E196 - 1;
      declare
         procedure F85;
         pragma Import (Ada, F85, "glib__object__finalize_spec");
      begin
         F85;
      end;
      E264 := E264 - 1;
      declare
         procedure F86;
         pragma Import (Ada, F86, "gdk__frame_timings__finalize_spec");
      begin
         F86;
      end;
      E183 := E183 - 1;
      declare
         procedure F87;
         pragma Import (Ada, F87, "glib__finalize_spec");
      begin
         F87;
      end;
      E415 := E415 - 1;
      declare
         procedure F88;
         pragma Import (Ada, F88, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F88;
      end;
      declare
         procedure F89;
         pragma Import (Ada, F89, "gnat__sockets__finalize_body");
      begin
         E435 := E435 - 1;
         F89;
      end;
      declare
         procedure F90;
         pragma Import (Ada, F90, "gnat__sockets__finalize_spec");
      begin
         F90;
      end;
      E444 := E444 - 1;
      declare
         procedure F91;
         pragma Import (Ada, F91, "system__pool_size__finalize_spec");
      begin
         F91;
      end;
      E188 := E188 - 1;
      declare
         procedure F92;
         pragma Import (Ada, F92, "system__pool_global__finalize_spec");
      begin
         F92;
      end;
      E175 := E175 - 1;
      declare
         procedure F93;
         pragma Import (Ada, F93, "ada__text_io__finalize_spec");
      begin
         F93;
      end;
      E134 := E134 - 1;
      declare
         procedure F94;
         pragma Import (Ada, F94, "ada__strings__unbounded__finalize_spec");
      begin
         F94;
      end;
      E148 := E148 - 1;
      declare
         procedure F95;
         pragma Import (Ada, F95, "system__storage_pools__subpools__finalize_spec");
      begin
         F95;
      end;
      E150 := E150 - 1;
      declare
         procedure F96;
         pragma Import (Ada, F96, "system__finalization_masters__finalize_spec");
      begin
         F96;
      end;
      declare
         procedure F97;
         pragma Import (Ada, F97, "system__file_io__finalize_body");
      begin
         E179 := E179 - 1;
         F97;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;
   pragma Favor_Top_Level (No_Param_Proc);

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, True, False, 
           False, False, False, False, False, True, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (True, False, False, False, True, True, False, False, 
           False, False, False, True, True, True, True, False, 
           False, False, False, False, True, True, False, True, 
           True, False, True, True, True, True, True, True, 
           False, False, False, True, False, True, True, False, 
           True, False, True, True, False, True, True, True, 
           True, False, True, True, False, False, False, False, 
           False, True, False, True, False, True, True, True, 
           False, False, True, False, True, True, True, False, 
           True, True, False, True, True, True, True, False, 
           True, False, False, False, False, True, False, False, 
           True, False, True, False),
         Count => (0, 0, 0, 4, 0, 0, 2, 0, 2, 0),
         Unknown => (False, False, False, False, False, False, True, False, True, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E027 := E027 + 1;
      Ada.Containers'Elab_Spec;
      E042 := E042 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E070 := E070 + 1;
      Ada.Strings'Elab_Spec;
      E054 := E054 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E056 := E056 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E060 := E060 + 1;
      Interfaces.C'Elab_Spec;
      E080 := E080 + 1;
      System.Exceptions'Elab_Spec;
      E029 := E029 + 1;
      System.Object_Reader'Elab_Spec;
      E082 := E082 + 1;
      System.Dwarf_Lines'Elab_Spec;
      E049 := E049 + 1;
      System.Os_Lib'Elab_Body;
      E074 := E074 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E023 := E023 + 1;
      E015 := E015 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E041 := E041 + 1;
      E010 := E010 + 1;
      Ada.Numerics'Elab_Spec;
      E420 := E420 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E138 := E138 + 1;
      Ada.Streams'Elab_Spec;
      E155 := E155 + 1;
      Gnat'Elab_Spec;
      E201 := E201 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E112 := E112 + 1;
      System.File_Control_Block'Elab_Spec;
      E180 := E180 + 1;
      System.Finalization_Root'Elab_Spec;
      E157 := E157 + 1;
      Ada.Finalization'Elab_Spec;
      E153 := E153 + 1;
      System.File_Io'Elab_Body;
      E179 := E179 + 1;
      System.Storage_Pools'Elab_Spec;
      E159 := E159 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E150 := E150 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E148 := E148 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E134 := E134 + 1;
      System.Task_Info'Elab_Spec;
      E122 := E122 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E008 := E008 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E006 := E006 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E106 := E106 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E175 := E175 + 1;
      System.Assertions'Elab_Spec;
      E464 := E464 + 1;
      System.Pool_Global'Elab_Spec;
      E188 := E188 + 1;
      System.Pool_Size'Elab_Spec;
      E444 := E444 + 1;
      Gnat.Sockets'Elab_Spec;
      Gnat.Sockets.Thin_Common'Elab_Spec;
      E440 := E440 + 1;
      Gnat.Sockets.Thin'Elab_Body;
      E438 := E438 + 1;
      Gnat.Sockets'Elab_Body;
      E435 := E435 + 1;
      System.Tasking.Initialization'Elab_Body;
      E403 := E403 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E413 := E413 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E415 := E415 + 1;
      System.Tasking.Queuing'Elab_Body;
      E411 := E411 + 1;
      System.Tasking.Stages'Elab_Body;
      E536 := E536 + 1;
      Glib'Elab_Spec;
      Gtkada.Types'Elab_Spec;
      E186 := E186 + 1;
      E183 := E183 + 1;
      Gdk.Frame_Timings'Elab_Spec;
      Gdk.Frame_Timings'Elab_Body;
      E264 := E264 + 1;
      E212 := E212 + 1;
      Gdk.Visual'Elab_Body;
      E248 := E248 + 1;
      E214 := E214 + 1;
      E429 := E429 + 1;
      E480 := E480 + 1;
      E206 := E206 + 1;
      Glib.Object'Elab_Spec;
      E198 := E198 + 1;
      Glib.Values'Elab_Body;
      E210 := E210 + 1;
      E200 := E200 + 1;
      Glib.Object'Elab_Body;
      E196 := E196 + 1;
      E208 := E208 + 1;
      E216 := E216 + 1;
      E218 := E218 + 1;
      E220 := E220 + 1;
      Glib.Generic_Properties'Elab_Spec;
      Glib.Generic_Properties'Elab_Body;
      E194 := E194 + 1;
      Gdk.Color'Elab_Spec;
      E256 := E256 + 1;
      Gdk.Color.Ihls'Elab_Body;
      E419 := E419 + 1;
      E238 := E238 + 1;
      E192 := E192 + 1;
      E355 := E355 + 1;
      E226 := E226 + 1;
      E490 := E490 + 1;
      E431 := E431 + 1;
      E427 := E427 + 1;
      E315 := E315 + 1;
      Glib.Variant'Elab_Spec;
      Glib.Variant'Elab_Body;
      E313 := E313 + 1;
      E311 := E311 + 1;
      Gtk.Actionable'Elab_Spec;
      E387 := E387 + 1;
      Gtk.Builder'Elab_Spec;
      Gtk.Builder'Elab_Body;
      E230 := E230 + 1;
      E228 := E228 + 1;
      Gtk.Cell_Area_Context'Elab_Spec;
      Gtk.Cell_Area_Context'Elab_Body;
      E329 := E329 + 1;
      Gtk.Css_Section'Elab_Spec;
      Gtk.Css_Section'Elab_Body;
      E345 := E345 + 1;
      E250 := E250 + 1;
      Gtk.Orientable'Elab_Spec;
      E369 := E369 + 1;
      Gtk.Paper_Size'Elab_Spec;
      Gtk.Paper_Size'Elab_Body;
      E357 := E357 + 1;
      Gtk.Page_Setup'Elab_Spec;
      Gtk.Page_Setup'Elab_Body;
      E353 := E353 + 1;
      Gtk.Print_Settings'Elab_Spec;
      Gtk.Print_Settings'Elab_Body;
      E365 := E365 + 1;
      E502 := E502 + 1;
      E276 := E276 + 1;
      Gtk.Target_List'Elab_Spec;
      Gtk.Target_List'Elab_Body;
      E274 := E274 + 1;
      Gtk.Text_Mark'Elab_Spec;
      Gtk.Text_Mark'Elab_Body;
      E508 := E508 + 1;
      E281 := E281 + 1;
      Pango.Attributes'Elab_Spec;
      Pango.Attributes'Elab_Body;
      E299 := E299 + 1;
      Pango.Font_Metrics'Elab_Spec;
      Pango.Font_Metrics'Elab_Body;
      E285 := E285 + 1;
      Pango.Language'Elab_Spec;
      Pango.Language'Elab_Body;
      E287 := E287 + 1;
      Pango.Font'Elab_Spec;
      Pango.Font'Elab_Body;
      E283 := E283 + 1;
      E373 := E373 + 1;
      Gtk.Text_Tag'Elab_Spec;
      Gtk.Text_Tag'Elab_Body;
      E375 := E375 + 1;
      Pango.Font_Face'Elab_Spec;
      Pango.Font_Face'Elab_Body;
      E291 := E291 + 1;
      Pango.Font_Family'Elab_Spec;
      Pango.Font_Family'Elab_Body;
      E289 := E289 + 1;
      Pango.Fontset'Elab_Spec;
      Pango.Fontset'Elab_Body;
      E293 := E293 + 1;
      E295 := E295 + 1;
      Pango.Context'Elab_Spec;
      Pango.Context'Elab_Body;
      E279 := E279 + 1;
      Pango.Font_Map'Elab_Spec;
      Pango.Font_Map'Elab_Body;
      E361 := E361 + 1;
      Pango.Tabs'Elab_Spec;
      Pango.Tabs'Elab_Body;
      E301 := E301 + 1;
      Pango.Layout'Elab_Spec;
      Pango.Layout'Elab_Body;
      E297 := E297 + 1;
      Gtk.Print_Context'Elab_Spec;
      Gtk.Print_Context'Elab_Body;
      E359 := E359 + 1;
      Gdk.Display'Elab_Spec;
      Gdk.Frame_Clock'Elab_Spec;
      Gdk.Pixbuf'Elab_Spec;
      E266 := E266 + 1;
      Gdk.Screen'Elab_Spec;
      Gdk.Screen'Elab_Body;
      E244 := E244 + 1;
      Gdk.Device'Elab_Spec;
      Gdk.Device'Elab_Body;
      E258 := E258 + 1;
      Gdk.Drag_Contexts'Elab_Spec;
      Gdk.Drag_Contexts'Elab_Body;
      E260 := E260 + 1;
      Gdk.Window'Elab_Spec;
      E305 := E305 + 1;
      Gtk.Accel_Group'Elab_Spec;
      Gtk.Adjustment'Elab_Spec;
      Gtk.Cell_Editable'Elab_Spec;
      Gtk.Entry_Buffer'Elab_Spec;
      Gtk.Icon_Source'Elab_Spec;
      Gtk.Icon_Source'Elab_Body;
      E341 := E341 + 1;
      Gtk.Selection_Data'Elab_Spec;
      Gtk.Selection_Data'Elab_Body;
      E270 := E270 + 1;
      Gtk.Style'Elab_Spec;
      E371 := E371 + 1;
      Gtk.Tree_Model'Elab_Spec;
      Gtk.Widget'Elab_Spec;
      Gtk.Cell_Renderer'Elab_Spec;
      E331 := E331 + 1;
      Gtk.Cell_Area'Elab_Spec;
      Gtk.Container'Elab_Spec;
      Gtk.Bin'Elab_Spec;
      Gtk.Bin'Elab_Body;
      E307 := E307 + 1;
      Gtk.Box'Elab_Spec;
      Gtk.Box'Elab_Body;
      E224 := E224 + 1;
      Gtk.Entry_Completion'Elab_Spec;
      Gtk.Misc'Elab_Spec;
      Gtk.Misc'Elab_Body;
      E347 := E347 + 1;
      Gtk.Notebook'Elab_Spec;
      Gtk.Status_Bar'Elab_Spec;
      E252 := E252 + 1;
      Gtk.Settings'Elab_Spec;
      Gtk.Settings'Elab_Body;
      E242 := E242 + 1;
      Gtk.Style_Context'Elab_Spec;
      Gtk.Icon_Set'Elab_Spec;
      Gtk.Icon_Set'Elab_Body;
      E339 := E339 + 1;
      Gtk.Image'Elab_Spec;
      Gtk.Image'Elab_Body;
      E337 := E337 + 1;
      Gtk.Gentry'Elab_Spec;
      Gtk.Window'Elab_Spec;
      Gtk.Dialog'Elab_Spec;
      Gtk.Print_Operation'Elab_Spec;
      E236 := E236 + 1;
      Gdk.Display'Elab_Body;
      E246 := E246 + 1;
      Gdk.Frame_Clock'Elab_Body;
      E262 := E262 + 1;
      Gtk.Accel_Group'Elab_Body;
      E268 := E268 + 1;
      Gtk.Adjustment'Elab_Body;
      E317 := E317 + 1;
      Gtk.Cell_Area'Elab_Body;
      E327 := E327 + 1;
      E319 := E319 + 1;
      Gtk.Cell_Renderer'Elab_Body;
      E333 := E333 + 1;
      Gtk.Container'Elab_Body;
      E234 := E234 + 1;
      Gtk.Dialog'Elab_Body;
      E240 := E240 + 1;
      E321 := E321 + 1;
      Gtk.Entry_Buffer'Elab_Body;
      E323 := E323 + 1;
      Gtk.Entry_Completion'Elab_Body;
      E325 := E325 + 1;
      Gtk.Gentry'Elab_Body;
      E309 := E309 + 1;
      Gtk.Notebook'Elab_Body;
      E349 := E349 + 1;
      Gtk.Print_Operation'Elab_Body;
      E351 := E351 + 1;
      E363 := E363 + 1;
      Gtk.Status_Bar'Elab_Body;
      E367 := E367 + 1;
      Gtk.Style'Elab_Body;
      E272 := E272 + 1;
      Gtk.Style_Context'Elab_Body;
      E343 := E343 + 1;
      Gtk.Tree_Model'Elab_Body;
      E335 := E335 + 1;
      Gtk.Widget'Elab_Body;
      E254 := E254 + 1;
      Gtk.Window'Elab_Body;
      E303 := E303 + 1;
      Gdk.Cursor'Elab_Spec;
      E474 := E474 + 1;
      Glib.Menu_Model'Elab_Spec;
      Glib.Menu_Model'Elab_Body;
      E381 := E381 + 1;
      E476 := E476 + 1;
      Gtk.Action'Elab_Spec;
      Gtk.Action'Elab_Body;
      E385 := E385 + 1;
      Gtk.Activatable'Elab_Spec;
      E389 := E389 + 1;
      Gtk.Button'Elab_Spec;
      Gtk.Button'Elab_Body;
      E454 := E454 + 1;
      Gtk.Cell_Renderer_Pixbuf'Elab_Spec;
      Gtk.Cell_Renderer_Pixbuf'Elab_Body;
      E492 := E492 + 1;
      Gtk.Clipboard'Elab_Spec;
      Gtk.Clipboard'Elab_Body;
      E460 := E460 + 1;
      Gtk.Css_Provider'Elab_Spec;
      Gtk.Css_Provider'Elab_Body;
      E482 := E482 + 1;
      Gtk.Grange'Elab_Spec;
      Gtk.Grange'Elab_Body;
      E526 := E526 + 1;
      Gtk.Icon_Theme'Elab_Spec;
      Gtk.Icon_Theme'Elab_Body;
      E484 := E484 + 1;
      E393 := E393 + 1;
      E466 := E466 + 1;
      Gtk.Menu_Item'Elab_Spec;
      Gtk.Menu_Item'Elab_Body;
      E383 := E383 + 1;
      Gtk.Image_Menu_Item'Elab_Spec;
      Gtk.Image_Menu_Item'Elab_Body;
      E470 := E470 + 1;
      Gtk.Menu_Shell'Elab_Spec;
      Gtk.Menu_Shell'Elab_Body;
      E391 := E391 + 1;
      Gtk.Menu'Elab_Spec;
      Gtk.Menu'Elab_Body;
      E379 := E379 + 1;
      Gtk.Label'Elab_Spec;
      Gtk.Label'Elab_Body;
      E377 := E377 + 1;
      Gtk.Scrollable'Elab_Spec;
      E516 := E516 + 1;
      Gtk.Scrollbar'Elab_Spec;
      Gtk.Scrollbar'Elab_Body;
      E524 := E524 + 1;
      Gtk.Scrolled_Window'Elab_Spec;
      Gtk.Scrolled_Window'Elab_Body;
      E522 := E522 + 1;
      Gtk.Table'Elab_Spec;
      Gtk.Table'Elab_Body;
      E538 := E538 + 1;
      Gtk.Text_Child_Anchor'Elab_Spec;
      Gtk.Text_Child_Anchor'Elab_Body;
      E506 := E506 + 1;
      Gtk.Text_Tag_Table'Elab_Spec;
      Gtk.Text_Tag_Table'Elab_Body;
      E510 := E510 + 1;
      Gtk.Text_Buffer'Elab_Spec;
      Gtk.Text_Buffer'Elab_Body;
      E504 := E504 + 1;
      Gtk.Text_View'Elab_Spec;
      Gtk.Text_View'Elab_Body;
      E528 := E528 + 1;
      Gtk.Toggle_Button'Elab_Spec;
      Gtk.Toggle_Button'Elab_Body;
      E458 := E458 + 1;
      Gtk.Check_Button'Elab_Spec;
      Gtk.Check_Button'Elab_Body;
      E456 := E456 + 1;
      Gtk.Tooltip'Elab_Spec;
      Gtk.Tooltip'Elab_Body;
      E518 := E518 + 1;
      E496 := E496 + 1;
      E498 := E498 + 1;
      Gtk.Tree_Selection'Elab_Spec;
      Gtk.Tree_Selection'Elab_Body;
      E520 := E520 + 1;
      E500 := E500 + 1;
      Gtk.List_Store'Elab_Spec;
      Gtk.List_Store'Elab_Body;
      E494 := E494 + 1;
      Gtk.Tree_Store'Elab_Spec;
      Gtk.Tree_Store'Elab_Body;
      E512 := E512 + 1;
      Gtk.Tree_View_Column'Elab_Spec;
      Gtk.Tree_View_Column'Elab_Body;
      E468 := E468 + 1;
      Gtk.Tree_View'Elab_Spec;
      Gtk.Tree_View'Elab_Body;
      E514 := E514 + 1;
      Gtk.Missed'Elab_Spec;
      Gtk.Missed'Elab_Body;
      E472 := E472 + 1;
      Gtk.Main.Router'Elab_Spec;
      Gtk.Main.Router'Elab_Body;
      E395 := E395 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_concurrent_zoo");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      if gnat_argc = 0 then
         gnat_argc := argc;
         gnat_argv := argv;
      end if;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   C:\GNAT\2020\include\gtkada_contributions_3_28\glib-wrappers.o
   --   C:\GNAT\2020\include\gtkada_contributions_3_28\gdk-color-ihls.o
   --   C:\GNAT\2020\include\gtkada_contributions_3_28\glib-object-checked_destroy.o
   --   C:\GNAT\2020\include\gtkada_contributions_3_28\gtk-missed.o
   --   C:\GNAT\2020\include\gtkada_contributions_3_28\gtk-main-router.o
   --   C:\Users\Kinga\Documents\GitHub\ConcurrentZOO\obj\concurrent_zoo.o
   --   -LC:\Users\Kinga\Documents\GitHub\ConcurrentZOO\obj\
   --   -LC:\Users\Kinga\Documents\GitHub\ConcurrentZOO\obj\
   --   -LC:\GNAT\2020\include\gtkada_contributions_3_28\
   --   -LC:\GtkAda\lib\gtkada\gtkada.static\gtkada\
   --   -LC:/gnat/2020/lib/gcc/x86_64-pc-mingw32/9.3.1/adalib/
   --   -static
   --   -shared-libgcc
   --   -shared-libgcc
   --   -shared-libgcc
   --   -lgnarl
   --   -lgnat
   --   -lws2_32
   --   -Xlinker
   --   --stack=0x200000,0x1000
   --   -mthreads
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
