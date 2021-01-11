pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__concurrent_zoo.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__concurrent_zoo.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E072 : Short_Integer; pragma Import (Ada, E072, "system__os_lib_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "ada__exceptions_E");
   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__exception_table_E");
   E040 : Short_Integer; pragma Import (Ada, E040, "ada__containers_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "ada__io_exceptions_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "ada__strings_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "ada__strings__maps_E");
   E058 : Short_Integer; pragma Import (Ada, E058, "ada__strings__maps__constants_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "interfaces__c_E");
   E027 : Short_Integer; pragma Import (Ada, E027, "system__exceptions_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "system__object_reader_E");
   E047 : Short_Integer; pragma Import (Ada, E047, "system__dwarf_lines_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__soft_links__initialize_E");
   E039 : Short_Integer; pragma Import (Ada, E039, "system__traceback__symbolic_E");
   E421 : Short_Integer; pragma Import (Ada, E421, "ada__numerics_E");
   E140 : Short_Integer; pragma Import (Ada, E140, "ada__tags_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "ada__streams_E");
   E203 : Short_Integer; pragma Import (Ada, E203, "gnat_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "interfaces__c__strings_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "system__file_control_block_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "system__finalization_root_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "ada__finalization_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "system__file_io_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "system__storage_pools_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "system__finalization_masters_E");
   E150 : Short_Integer; pragma Import (Ada, E150, "system__storage_pools__subpools_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "ada__strings__unbounded_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "system__task_info_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__calendar_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "ada__calendar__delays_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "ada__real_time_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "ada__text_io_E");
   E465 : Short_Integer; pragma Import (Ada, E465, "system__assertions_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "system__pool_global_E");
   E445 : Short_Integer; pragma Import (Ada, E445, "system__pool_size_E");
   E436 : Short_Integer; pragma Import (Ada, E436, "gnat__sockets_E");
   E441 : Short_Integer; pragma Import (Ada, E441, "gnat__sockets__thin_common_E");
   E439 : Short_Integer; pragma Import (Ada, E439, "gnat__sockets__thin_E");
   E404 : Short_Integer; pragma Import (Ada, E404, "system__tasking__initialization_E");
   E414 : Short_Integer; pragma Import (Ada, E414, "system__tasking__protected_objects_E");
   E416 : Short_Integer; pragma Import (Ada, E416, "system__tasking__protected_objects__entries_E");
   E412 : Short_Integer; pragma Import (Ada, E412, "system__tasking__queuing_E");
   E537 : Short_Integer; pragma Import (Ada, E537, "system__tasking__stages_E");
   E185 : Short_Integer; pragma Import (Ada, E185, "glib_E");
   E188 : Short_Integer; pragma Import (Ada, E188, "gtkada__types_E");
   E267 : Short_Integer; pragma Import (Ada, E267, "gdk__frame_timings_E");
   E214 : Short_Integer; pragma Import (Ada, E214, "glib__glist_E");
   E251 : Short_Integer; pragma Import (Ada, E251, "gdk__visual_E");
   E216 : Short_Integer; pragma Import (Ada, E216, "glib__gslist_E");
   E430 : Short_Integer; pragma Import (Ada, E430, "glib__poll_E");
   E481 : Short_Integer; pragma Import (Ada, E481, "glib__wrappers_E");
   E208 : Short_Integer; pragma Import (Ada, E208, "gtkada__c_E");
   E198 : Short_Integer; pragma Import (Ada, E198, "glib__object_E");
   E200 : Short_Integer; pragma Import (Ada, E200, "glib__type_conversion_hooks_E");
   E210 : Short_Integer; pragma Import (Ada, E210, "glib__types_E");
   E212 : Short_Integer; pragma Import (Ada, E212, "glib__values_E");
   E202 : Short_Integer; pragma Import (Ada, E202, "gtkada__bindings_E");
   E218 : Short_Integer; pragma Import (Ada, E218, "cairo_E");
   E220 : Short_Integer; pragma Import (Ada, E220, "cairo__region_E");
   E222 : Short_Integer; pragma Import (Ada, E222, "gdk__rectangle_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "glib__generic_properties_E");
   E259 : Short_Integer; pragma Import (Ada, E259, "gdk__color_E");
   E420 : Short_Integer; pragma Import (Ada, E420, "gdk__color__ihls_E");
   E241 : Short_Integer; pragma Import (Ada, E241, "gdk__rgba_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "gdk__event_E");
   E358 : Short_Integer; pragma Import (Ada, E358, "glib__key_file_E");
   E229 : Short_Integer; pragma Import (Ada, E229, "glib__properties_E");
   E491 : Short_Integer; pragma Import (Ada, E491, "glib__properties__creation_E");
   E432 : Short_Integer; pragma Import (Ada, E432, "glib__spawn_E");
   E428 : Short_Integer; pragma Import (Ada, E428, "glib__main_E");
   E318 : Short_Integer; pragma Import (Ada, E318, "glib__string_E");
   E316 : Short_Integer; pragma Import (Ada, E316, "glib__variant_E");
   E314 : Short_Integer; pragma Import (Ada, E314, "glib__g_icon_E");
   E390 : Short_Integer; pragma Import (Ada, E390, "gtk__actionable_E");
   E233 : Short_Integer; pragma Import (Ada, E233, "gtk__builder_E");
   E231 : Short_Integer; pragma Import (Ada, E231, "gtk__buildable_E");
   E332 : Short_Integer; pragma Import (Ada, E332, "gtk__cell_area_context_E");
   E348 : Short_Integer; pragma Import (Ada, E348, "gtk__css_section_E");
   E253 : Short_Integer; pragma Import (Ada, E253, "gtk__enums_E");
   E372 : Short_Integer; pragma Import (Ada, E372, "gtk__orientable_E");
   E360 : Short_Integer; pragma Import (Ada, E360, "gtk__paper_size_E");
   E356 : Short_Integer; pragma Import (Ada, E356, "gtk__page_setup_E");
   E368 : Short_Integer; pragma Import (Ada, E368, "gtk__print_settings_E");
   E503 : Short_Integer; pragma Import (Ada, E503, "gtk__stock_E");
   E279 : Short_Integer; pragma Import (Ada, E279, "gtk__target_entry_E");
   E277 : Short_Integer; pragma Import (Ada, E277, "gtk__target_list_E");
   E509 : Short_Integer; pragma Import (Ada, E509, "gtk__text_mark_E");
   E284 : Short_Integer; pragma Import (Ada, E284, "pango__enums_E");
   E302 : Short_Integer; pragma Import (Ada, E302, "pango__attributes_E");
   E288 : Short_Integer; pragma Import (Ada, E288, "pango__font_metrics_E");
   E290 : Short_Integer; pragma Import (Ada, E290, "pango__language_E");
   E286 : Short_Integer; pragma Import (Ada, E286, "pango__font_E");
   E376 : Short_Integer; pragma Import (Ada, E376, "gtk__text_attributes_E");
   E378 : Short_Integer; pragma Import (Ada, E378, "gtk__text_tag_E");
   E294 : Short_Integer; pragma Import (Ada, E294, "pango__font_face_E");
   E292 : Short_Integer; pragma Import (Ada, E292, "pango__font_family_E");
   E296 : Short_Integer; pragma Import (Ada, E296, "pango__fontset_E");
   E298 : Short_Integer; pragma Import (Ada, E298, "pango__matrix_E");
   E282 : Short_Integer; pragma Import (Ada, E282, "pango__context_E");
   E364 : Short_Integer; pragma Import (Ada, E364, "pango__font_map_E");
   E304 : Short_Integer; pragma Import (Ada, E304, "pango__tabs_E");
   E300 : Short_Integer; pragma Import (Ada, E300, "pango__layout_E");
   E362 : Short_Integer; pragma Import (Ada, E362, "gtk__print_context_E");
   E249 : Short_Integer; pragma Import (Ada, E249, "gdk__display_E");
   E265 : Short_Integer; pragma Import (Ada, E265, "gdk__frame_clock_E");
   E269 : Short_Integer; pragma Import (Ada, E269, "gdk__pixbuf_E");
   E247 : Short_Integer; pragma Import (Ada, E247, "gdk__screen_E");
   E261 : Short_Integer; pragma Import (Ada, E261, "gdk__device_E");
   E263 : Short_Integer; pragma Import (Ada, E263, "gdk__drag_contexts_E");
   E308 : Short_Integer; pragma Import (Ada, E308, "gdk__window_E");
   E271 : Short_Integer; pragma Import (Ada, E271, "gtk__accel_group_E");
   E320 : Short_Integer; pragma Import (Ada, E320, "gtk__adjustment_E");
   E322 : Short_Integer; pragma Import (Ada, E322, "gtk__cell_editable_E");
   E324 : Short_Integer; pragma Import (Ada, E324, "gtk__editable_E");
   E326 : Short_Integer; pragma Import (Ada, E326, "gtk__entry_buffer_E");
   E344 : Short_Integer; pragma Import (Ada, E344, "gtk__icon_source_E");
   E366 : Short_Integer; pragma Import (Ada, E366, "gtk__print_operation_preview_E");
   E273 : Short_Integer; pragma Import (Ada, E273, "gtk__selection_data_E");
   E275 : Short_Integer; pragma Import (Ada, E275, "gtk__style_E");
   E374 : Short_Integer; pragma Import (Ada, E374, "gtk__text_iter_E");
   E338 : Short_Integer; pragma Import (Ada, E338, "gtk__tree_model_E");
   E257 : Short_Integer; pragma Import (Ada, E257, "gtk__widget_E");
   E336 : Short_Integer; pragma Import (Ada, E336, "gtk__cell_renderer_E");
   E334 : Short_Integer; pragma Import (Ada, E334, "gtk__cell_layout_E");
   E330 : Short_Integer; pragma Import (Ada, E330, "gtk__cell_area_E");
   E237 : Short_Integer; pragma Import (Ada, E237, "gtk__container_E");
   E310 : Short_Integer; pragma Import (Ada, E310, "gtk__bin_E");
   E227 : Short_Integer; pragma Import (Ada, E227, "gtk__box_E");
   E328 : Short_Integer; pragma Import (Ada, E328, "gtk__entry_completion_E");
   E350 : Short_Integer; pragma Import (Ada, E350, "gtk__misc_E");
   E352 : Short_Integer; pragma Import (Ada, E352, "gtk__notebook_E");
   E370 : Short_Integer; pragma Import (Ada, E370, "gtk__status_bar_E");
   E255 : Short_Integer; pragma Import (Ada, E255, "gtk__style_provider_E");
   E245 : Short_Integer; pragma Import (Ada, E245, "gtk__settings_E");
   E346 : Short_Integer; pragma Import (Ada, E346, "gtk__style_context_E");
   E342 : Short_Integer; pragma Import (Ada, E342, "gtk__icon_set_E");
   E340 : Short_Integer; pragma Import (Ada, E340, "gtk__image_E");
   E312 : Short_Integer; pragma Import (Ada, E312, "gtk__gentry_E");
   E306 : Short_Integer; pragma Import (Ada, E306, "gtk__window_E");
   E243 : Short_Integer; pragma Import (Ada, E243, "gtk__dialog_E");
   E354 : Short_Integer; pragma Import (Ada, E354, "gtk__print_operation_E");
   E239 : Short_Integer; pragma Import (Ada, E239, "gtk__arguments_E");
   E475 : Short_Integer; pragma Import (Ada, E475, "gdk__cursor_E");
   E384 : Short_Integer; pragma Import (Ada, E384, "glib__menu_model_E");
   E477 : Short_Integer; pragma Import (Ada, E477, "glib__object__checked_destroy_E");
   E388 : Short_Integer; pragma Import (Ada, E388, "gtk__action_E");
   E392 : Short_Integer; pragma Import (Ada, E392, "gtk__activatable_E");
   E455 : Short_Integer; pragma Import (Ada, E455, "gtk__button_E");
   E493 : Short_Integer; pragma Import (Ada, E493, "gtk__cell_renderer_pixbuf_E");
   E461 : Short_Integer; pragma Import (Ada, E461, "gtk__clipboard_E");
   E483 : Short_Integer; pragma Import (Ada, E483, "gtk__css_provider_E");
   E527 : Short_Integer; pragma Import (Ada, E527, "gtk__grange_E");
   E485 : Short_Integer; pragma Import (Ada, E485, "gtk__icon_theme_E");
   E396 : Short_Integer; pragma Import (Ada, E396, "gtk__main_E");
   E467 : Short_Integer; pragma Import (Ada, E467, "gtk__marshallers_E");
   E386 : Short_Integer; pragma Import (Ada, E386, "gtk__menu_item_E");
   E471 : Short_Integer; pragma Import (Ada, E471, "gtk__image_menu_item_E");
   E394 : Short_Integer; pragma Import (Ada, E394, "gtk__menu_shell_E");
   E382 : Short_Integer; pragma Import (Ada, E382, "gtk__menu_E");
   E380 : Short_Integer; pragma Import (Ada, E380, "gtk__label_E");
   E517 : Short_Integer; pragma Import (Ada, E517, "gtk__scrollable_E");
   E525 : Short_Integer; pragma Import (Ada, E525, "gtk__scrollbar_E");
   E523 : Short_Integer; pragma Import (Ada, E523, "gtk__scrolled_window_E");
   E539 : Short_Integer; pragma Import (Ada, E539, "gtk__table_E");
   E507 : Short_Integer; pragma Import (Ada, E507, "gtk__text_child_anchor_E");
   E511 : Short_Integer; pragma Import (Ada, E511, "gtk__text_tag_table_E");
   E505 : Short_Integer; pragma Import (Ada, E505, "gtk__text_buffer_E");
   E529 : Short_Integer; pragma Import (Ada, E529, "gtk__text_view_E");
   E459 : Short_Integer; pragma Import (Ada, E459, "gtk__toggle_button_E");
   E457 : Short_Integer; pragma Import (Ada, E457, "gtk__check_button_E");
   E519 : Short_Integer; pragma Import (Ada, E519, "gtk__tooltip_E");
   E497 : Short_Integer; pragma Import (Ada, E497, "gtk__tree_drag_dest_E");
   E499 : Short_Integer; pragma Import (Ada, E499, "gtk__tree_drag_source_E");
   E521 : Short_Integer; pragma Import (Ada, E521, "gtk__tree_selection_E");
   E501 : Short_Integer; pragma Import (Ada, E501, "gtk__tree_sortable_E");
   E495 : Short_Integer; pragma Import (Ada, E495, "gtk__list_store_E");
   E513 : Short_Integer; pragma Import (Ada, E513, "gtk__tree_store_E");
   E469 : Short_Integer; pragma Import (Ada, E469, "gtk__tree_view_column_E");
   E515 : Short_Integer; pragma Import (Ada, E515, "gtk__tree_view_E");
   E473 : Short_Integer; pragma Import (Ada, E473, "gtk__missed_E");
   E398 : Short_Integer; pragma Import (Ada, E398, "gtk__main__router_E");

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
         E398 := E398 - 1;
         F1;
      end;
      declare
         procedure F2;
         pragma Import (Ada, F2, "gtk__main__router__finalize_spec");
      begin
         F2;
      end;
      E473 := E473 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "gtk__missed__finalize_spec");
      begin
         F3;
      end;
      E515 := E515 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "gtk__tree_view__finalize_spec");
      begin
         F4;
      end;
      E469 := E469 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "gtk__tree_view_column__finalize_spec");
      begin
         F5;
      end;
      E513 := E513 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "gtk__tree_store__finalize_spec");
      begin
         F6;
      end;
      E495 := E495 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "gtk__list_store__finalize_spec");
      begin
         F7;
      end;
      E521 := E521 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "gtk__tree_selection__finalize_spec");
      begin
         F8;
      end;
      E519 := E519 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "gtk__tooltip__finalize_spec");
      begin
         F9;
      end;
      E457 := E457 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "gtk__check_button__finalize_spec");
      begin
         F10;
      end;
      E459 := E459 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "gtk__toggle_button__finalize_spec");
      begin
         F11;
      end;
      E529 := E529 - 1;
      declare
         procedure F12;
         pragma Import (Ada, F12, "gtk__text_view__finalize_spec");
      begin
         F12;
      end;
      E505 := E505 - 1;
      declare
         procedure F13;
         pragma Import (Ada, F13, "gtk__text_buffer__finalize_spec");
      begin
         F13;
      end;
      E511 := E511 - 1;
      declare
         procedure F14;
         pragma Import (Ada, F14, "gtk__text_tag_table__finalize_spec");
      begin
         F14;
      end;
      E507 := E507 - 1;
      declare
         procedure F15;
         pragma Import (Ada, F15, "gtk__text_child_anchor__finalize_spec");
      begin
         F15;
      end;
      E539 := E539 - 1;
      declare
         procedure F16;
         pragma Import (Ada, F16, "gtk__table__finalize_spec");
      begin
         F16;
      end;
      E523 := E523 - 1;
      declare
         procedure F17;
         pragma Import (Ada, F17, "gtk__scrolled_window__finalize_spec");
      begin
         F17;
      end;
      E525 := E525 - 1;
      declare
         procedure F18;
         pragma Import (Ada, F18, "gtk__scrollbar__finalize_spec");
      begin
         F18;
      end;
      E380 := E380 - 1;
      declare
         procedure F19;
         pragma Import (Ada, F19, "gtk__label__finalize_spec");
      begin
         F19;
      end;
      E382 := E382 - 1;
      declare
         procedure F20;
         pragma Import (Ada, F20, "gtk__menu__finalize_spec");
      begin
         F20;
      end;
      E394 := E394 - 1;
      declare
         procedure F21;
         pragma Import (Ada, F21, "gtk__menu_shell__finalize_spec");
      begin
         F21;
      end;
      E471 := E471 - 1;
      declare
         procedure F22;
         pragma Import (Ada, F22, "gtk__image_menu_item__finalize_spec");
      begin
         F22;
      end;
      E386 := E386 - 1;
      declare
         procedure F23;
         pragma Import (Ada, F23, "gtk__menu_item__finalize_spec");
      begin
         F23;
      end;
      E485 := E485 - 1;
      declare
         procedure F24;
         pragma Import (Ada, F24, "gtk__icon_theme__finalize_spec");
      begin
         F24;
      end;
      E527 := E527 - 1;
      declare
         procedure F25;
         pragma Import (Ada, F25, "gtk__grange__finalize_spec");
      begin
         F25;
      end;
      E483 := E483 - 1;
      declare
         procedure F26;
         pragma Import (Ada, F26, "gtk__css_provider__finalize_spec");
      begin
         F26;
      end;
      E461 := E461 - 1;
      declare
         procedure F27;
         pragma Import (Ada, F27, "gtk__clipboard__finalize_spec");
      begin
         F27;
      end;
      E493 := E493 - 1;
      declare
         procedure F28;
         pragma Import (Ada, F28, "gtk__cell_renderer_pixbuf__finalize_spec");
      begin
         F28;
      end;
      E455 := E455 - 1;
      declare
         procedure F29;
         pragma Import (Ada, F29, "gtk__button__finalize_spec");
      begin
         F29;
      end;
      E388 := E388 - 1;
      declare
         procedure F30;
         pragma Import (Ada, F30, "gtk__action__finalize_spec");
      begin
         F30;
      end;
      E384 := E384 - 1;
      declare
         procedure F31;
         pragma Import (Ada, F31, "glib__menu_model__finalize_spec");
      begin
         F31;
      end;
      E306 := E306 - 1;
      E257 := E257 - 1;
      E338 := E338 - 1;
      E346 := E346 - 1;
      E275 := E275 - 1;
      E370 := E370 - 1;
      E354 := E354 - 1;
      E352 := E352 - 1;
      E312 := E312 - 1;
      E328 := E328 - 1;
      E326 := E326 - 1;
      E243 := E243 - 1;
      E237 := E237 - 1;
      E336 := E336 - 1;
      E330 := E330 - 1;
      E320 := E320 - 1;
      E271 := E271 - 1;
      E265 := E265 - 1;
      E249 := E249 - 1;
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
      E340 := E340 - 1;
      declare
         procedure F36;
         pragma Import (Ada, F36, "gtk__image__finalize_spec");
      begin
         F36;
      end;
      E342 := E342 - 1;
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
      E245 := E245 - 1;
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
      E350 := E350 - 1;
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
      E227 := E227 - 1;
      declare
         procedure F44;
         pragma Import (Ada, F44, "gtk__box__finalize_spec");
      begin
         F44;
      end;
      E310 := E310 - 1;
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
      E273 := E273 - 1;
      declare
         procedure F52;
         pragma Import (Ada, F52, "gtk__selection_data__finalize_spec");
      begin
         F52;
      end;
      E344 := E344 - 1;
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
      E263 := E263 - 1;
      declare
         procedure F57;
         pragma Import (Ada, F57, "gdk__drag_contexts__finalize_spec");
      begin
         F57;
      end;
      E261 := E261 - 1;
      declare
         procedure F58;
         pragma Import (Ada, F58, "gdk__device__finalize_spec");
      begin
         F58;
      end;
      E247 := E247 - 1;
      declare
         procedure F59;
         pragma Import (Ada, F59, "gdk__screen__finalize_spec");
      begin
         F59;
      end;
      E269 := E269 - 1;
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
      E362 := E362 - 1;
      declare
         procedure F63;
         pragma Import (Ada, F63, "gtk__print_context__finalize_spec");
      begin
         F63;
      end;
      E300 := E300 - 1;
      declare
         procedure F64;
         pragma Import (Ada, F64, "pango__layout__finalize_spec");
      begin
         F64;
      end;
      E304 := E304 - 1;
      declare
         procedure F65;
         pragma Import (Ada, F65, "pango__tabs__finalize_spec");
      begin
         F65;
      end;
      E364 := E364 - 1;
      declare
         procedure F66;
         pragma Import (Ada, F66, "pango__font_map__finalize_spec");
      begin
         F66;
      end;
      E282 := E282 - 1;
      declare
         procedure F67;
         pragma Import (Ada, F67, "pango__context__finalize_spec");
      begin
         F67;
      end;
      E296 := E296 - 1;
      declare
         procedure F68;
         pragma Import (Ada, F68, "pango__fontset__finalize_spec");
      begin
         F68;
      end;
      E292 := E292 - 1;
      declare
         procedure F69;
         pragma Import (Ada, F69, "pango__font_family__finalize_spec");
      begin
         F69;
      end;
      E294 := E294 - 1;
      declare
         procedure F70;
         pragma Import (Ada, F70, "pango__font_face__finalize_spec");
      begin
         F70;
      end;
      E378 := E378 - 1;
      declare
         procedure F71;
         pragma Import (Ada, F71, "gtk__text_tag__finalize_spec");
      begin
         F71;
      end;
      E286 := E286 - 1;
      declare
         procedure F72;
         pragma Import (Ada, F72, "pango__font__finalize_spec");
      begin
         F72;
      end;
      E290 := E290 - 1;
      declare
         procedure F73;
         pragma Import (Ada, F73, "pango__language__finalize_spec");
      begin
         F73;
      end;
      E288 := E288 - 1;
      declare
         procedure F74;
         pragma Import (Ada, F74, "pango__font_metrics__finalize_spec");
      begin
         F74;
      end;
      E302 := E302 - 1;
      declare
         procedure F75;
         pragma Import (Ada, F75, "pango__attributes__finalize_spec");
      begin
         F75;
      end;
      E509 := E509 - 1;
      declare
         procedure F76;
         pragma Import (Ada, F76, "gtk__text_mark__finalize_spec");
      begin
         F76;
      end;
      E277 := E277 - 1;
      declare
         procedure F77;
         pragma Import (Ada, F77, "gtk__target_list__finalize_spec");
      begin
         F77;
      end;
      E368 := E368 - 1;
      declare
         procedure F78;
         pragma Import (Ada, F78, "gtk__print_settings__finalize_spec");
      begin
         F78;
      end;
      E356 := E356 - 1;
      declare
         procedure F79;
         pragma Import (Ada, F79, "gtk__page_setup__finalize_spec");
      begin
         F79;
      end;
      E360 := E360 - 1;
      declare
         procedure F80;
         pragma Import (Ada, F80, "gtk__paper_size__finalize_spec");
      begin
         F80;
      end;
      E348 := E348 - 1;
      declare
         procedure F81;
         pragma Import (Ada, F81, "gtk__css_section__finalize_spec");
      begin
         F81;
      end;
      E332 := E332 - 1;
      declare
         procedure F82;
         pragma Import (Ada, F82, "gtk__cell_area_context__finalize_spec");
      begin
         F82;
      end;
      E233 := E233 - 1;
      declare
         procedure F83;
         pragma Import (Ada, F83, "gtk__builder__finalize_spec");
      begin
         F83;
      end;
      E316 := E316 - 1;
      declare
         procedure F84;
         pragma Import (Ada, F84, "glib__variant__finalize_spec");
      begin
         F84;
      end;
      E198 := E198 - 1;
      declare
         procedure F85;
         pragma Import (Ada, F85, "glib__object__finalize_spec");
      begin
         F85;
      end;
      E267 := E267 - 1;
      declare
         procedure F86;
         pragma Import (Ada, F86, "gdk__frame_timings__finalize_spec");
      begin
         F86;
      end;
      E185 := E185 - 1;
      declare
         procedure F87;
         pragma Import (Ada, F87, "glib__finalize_spec");
      begin
         F87;
      end;
      E416 := E416 - 1;
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
         E436 := E436 - 1;
         F89;
      end;
      declare
         procedure F90;
         pragma Import (Ada, F90, "gnat__sockets__finalize_spec");
      begin
         F90;
      end;
      E445 := E445 - 1;
      declare
         procedure F91;
         pragma Import (Ada, F91, "system__pool_size__finalize_spec");
      begin
         F91;
      end;
      E190 := E190 - 1;
      declare
         procedure F92;
         pragma Import (Ada, F92, "system__pool_global__finalize_spec");
      begin
         F92;
      end;
      E177 := E177 - 1;
      declare
         procedure F93;
         pragma Import (Ada, F93, "ada__text_io__finalize_spec");
      begin
         F93;
      end;
      E138 := E138 - 1;
      declare
         procedure F94;
         pragma Import (Ada, F94, "ada__strings__unbounded__finalize_spec");
      begin
         F94;
      end;
      E150 := E150 - 1;
      declare
         procedure F95;
         pragma Import (Ada, F95, "system__storage_pools__subpools__finalize_spec");
      begin
         F95;
      end;
      E152 := E152 - 1;
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
         E181 := E181 - 1;
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
           True, False, False, True, True, True, True, False, 
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
      E025 := E025 + 1;
      Ada.Containers'Elab_Spec;
      E040 := E040 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E068 := E068 + 1;
      Ada.Strings'Elab_Spec;
      E052 := E052 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E054 := E054 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E058 := E058 + 1;
      Interfaces.C'Elab_Spec;
      E078 := E078 + 1;
      System.Exceptions'Elab_Spec;
      E027 := E027 + 1;
      System.Object_Reader'Elab_Spec;
      E080 := E080 + 1;
      System.Dwarf_Lines'Elab_Spec;
      E047 := E047 + 1;
      System.Os_Lib'Elab_Body;
      E072 := E072 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E021 := E021 + 1;
      E013 := E013 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E039 := E039 + 1;
      E008 := E008 + 1;
      Ada.Numerics'Elab_Spec;
      E421 := E421 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E140 := E140 + 1;
      Ada.Streams'Elab_Spec;
      E157 := E157 + 1;
      Gnat'Elab_Spec;
      E203 := E203 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E112 := E112 + 1;
      System.File_Control_Block'Elab_Spec;
      E182 := E182 + 1;
      System.Finalization_Root'Elab_Spec;
      E159 := E159 + 1;
      Ada.Finalization'Elab_Spec;
      E155 := E155 + 1;
      System.File_Io'Elab_Body;
      E181 := E181 + 1;
      System.Storage_Pools'Elab_Spec;
      E161 := E161 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E152 := E152 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E150 := E150 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E138 := E138 + 1;
      System.Task_Info'Elab_Spec;
      E122 := E122 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E006 := E006 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E104 := E104 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E106 := E106 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E177 := E177 + 1;
      System.Assertions'Elab_Spec;
      E465 := E465 + 1;
      System.Pool_Global'Elab_Spec;
      E190 := E190 + 1;
      System.Pool_Size'Elab_Spec;
      E445 := E445 + 1;
      Gnat.Sockets'Elab_Spec;
      Gnat.Sockets.Thin_Common'Elab_Spec;
      E441 := E441 + 1;
      Gnat.Sockets.Thin'Elab_Body;
      E439 := E439 + 1;
      Gnat.Sockets'Elab_Body;
      E436 := E436 + 1;
      System.Tasking.Initialization'Elab_Body;
      E404 := E404 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E414 := E414 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E416 := E416 + 1;
      System.Tasking.Queuing'Elab_Body;
      E412 := E412 + 1;
      System.Tasking.Stages'Elab_Body;
      E537 := E537 + 1;
      Glib'Elab_Spec;
      Gtkada.Types'Elab_Spec;
      E188 := E188 + 1;
      E185 := E185 + 1;
      Gdk.Frame_Timings'Elab_Spec;
      Gdk.Frame_Timings'Elab_Body;
      E267 := E267 + 1;
      E214 := E214 + 1;
      Gdk.Visual'Elab_Body;
      E251 := E251 + 1;
      E216 := E216 + 1;
      E430 := E430 + 1;
      E481 := E481 + 1;
      E208 := E208 + 1;
      Glib.Object'Elab_Spec;
      E200 := E200 + 1;
      Glib.Values'Elab_Body;
      E212 := E212 + 1;
      E202 := E202 + 1;
      Glib.Object'Elab_Body;
      E198 := E198 + 1;
      E210 := E210 + 1;
      E218 := E218 + 1;
      E220 := E220 + 1;
      E222 := E222 + 1;
      Glib.Generic_Properties'Elab_Spec;
      Glib.Generic_Properties'Elab_Body;
      E196 := E196 + 1;
      Gdk.Color'Elab_Spec;
      E259 := E259 + 1;
      Gdk.Color.Ihls'Elab_Body;
      E420 := E420 + 1;
      E241 := E241 + 1;
      E194 := E194 + 1;
      E358 := E358 + 1;
      E229 := E229 + 1;
      E491 := E491 + 1;
      E432 := E432 + 1;
      E428 := E428 + 1;
      E318 := E318 + 1;
      Glib.Variant'Elab_Spec;
      Glib.Variant'Elab_Body;
      E316 := E316 + 1;
      E314 := E314 + 1;
      Gtk.Actionable'Elab_Spec;
      E390 := E390 + 1;
      Gtk.Builder'Elab_Spec;
      Gtk.Builder'Elab_Body;
      E233 := E233 + 1;
      E231 := E231 + 1;
      Gtk.Cell_Area_Context'Elab_Spec;
      Gtk.Cell_Area_Context'Elab_Body;
      E332 := E332 + 1;
      Gtk.Css_Section'Elab_Spec;
      Gtk.Css_Section'Elab_Body;
      E348 := E348 + 1;
      E253 := E253 + 1;
      Gtk.Orientable'Elab_Spec;
      E372 := E372 + 1;
      Gtk.Paper_Size'Elab_Spec;
      Gtk.Paper_Size'Elab_Body;
      E360 := E360 + 1;
      Gtk.Page_Setup'Elab_Spec;
      Gtk.Page_Setup'Elab_Body;
      E356 := E356 + 1;
      Gtk.Print_Settings'Elab_Spec;
      Gtk.Print_Settings'Elab_Body;
      E368 := E368 + 1;
      E503 := E503 + 1;
      E279 := E279 + 1;
      Gtk.Target_List'Elab_Spec;
      Gtk.Target_List'Elab_Body;
      E277 := E277 + 1;
      Gtk.Text_Mark'Elab_Spec;
      Gtk.Text_Mark'Elab_Body;
      E509 := E509 + 1;
      E284 := E284 + 1;
      Pango.Attributes'Elab_Spec;
      Pango.Attributes'Elab_Body;
      E302 := E302 + 1;
      Pango.Font_Metrics'Elab_Spec;
      Pango.Font_Metrics'Elab_Body;
      E288 := E288 + 1;
      Pango.Language'Elab_Spec;
      Pango.Language'Elab_Body;
      E290 := E290 + 1;
      Pango.Font'Elab_Spec;
      Pango.Font'Elab_Body;
      E286 := E286 + 1;
      E376 := E376 + 1;
      Gtk.Text_Tag'Elab_Spec;
      Gtk.Text_Tag'Elab_Body;
      E378 := E378 + 1;
      Pango.Font_Face'Elab_Spec;
      Pango.Font_Face'Elab_Body;
      E294 := E294 + 1;
      Pango.Font_Family'Elab_Spec;
      Pango.Font_Family'Elab_Body;
      E292 := E292 + 1;
      Pango.Fontset'Elab_Spec;
      Pango.Fontset'Elab_Body;
      E296 := E296 + 1;
      E298 := E298 + 1;
      Pango.Context'Elab_Spec;
      Pango.Context'Elab_Body;
      E282 := E282 + 1;
      Pango.Font_Map'Elab_Spec;
      Pango.Font_Map'Elab_Body;
      E364 := E364 + 1;
      Pango.Tabs'Elab_Spec;
      Pango.Tabs'Elab_Body;
      E304 := E304 + 1;
      Pango.Layout'Elab_Spec;
      Pango.Layout'Elab_Body;
      E300 := E300 + 1;
      Gtk.Print_Context'Elab_Spec;
      Gtk.Print_Context'Elab_Body;
      E362 := E362 + 1;
      Gdk.Display'Elab_Spec;
      Gdk.Frame_Clock'Elab_Spec;
      Gdk.Pixbuf'Elab_Spec;
      E269 := E269 + 1;
      Gdk.Screen'Elab_Spec;
      Gdk.Screen'Elab_Body;
      E247 := E247 + 1;
      Gdk.Device'Elab_Spec;
      Gdk.Device'Elab_Body;
      E261 := E261 + 1;
      Gdk.Drag_Contexts'Elab_Spec;
      Gdk.Drag_Contexts'Elab_Body;
      E263 := E263 + 1;
      Gdk.Window'Elab_Spec;
      E308 := E308 + 1;
      Gtk.Accel_Group'Elab_Spec;
      Gtk.Adjustment'Elab_Spec;
      Gtk.Cell_Editable'Elab_Spec;
      Gtk.Entry_Buffer'Elab_Spec;
      Gtk.Icon_Source'Elab_Spec;
      Gtk.Icon_Source'Elab_Body;
      E344 := E344 + 1;
      Gtk.Selection_Data'Elab_Spec;
      Gtk.Selection_Data'Elab_Body;
      E273 := E273 + 1;
      Gtk.Style'Elab_Spec;
      E374 := E374 + 1;
      Gtk.Tree_Model'Elab_Spec;
      Gtk.Widget'Elab_Spec;
      Gtk.Cell_Renderer'Elab_Spec;
      E334 := E334 + 1;
      Gtk.Cell_Area'Elab_Spec;
      Gtk.Container'Elab_Spec;
      Gtk.Bin'Elab_Spec;
      Gtk.Bin'Elab_Body;
      E310 := E310 + 1;
      Gtk.Box'Elab_Spec;
      Gtk.Box'Elab_Body;
      E227 := E227 + 1;
      Gtk.Entry_Completion'Elab_Spec;
      Gtk.Misc'Elab_Spec;
      Gtk.Misc'Elab_Body;
      E350 := E350 + 1;
      Gtk.Notebook'Elab_Spec;
      Gtk.Status_Bar'Elab_Spec;
      E255 := E255 + 1;
      Gtk.Settings'Elab_Spec;
      Gtk.Settings'Elab_Body;
      E245 := E245 + 1;
      Gtk.Style_Context'Elab_Spec;
      Gtk.Icon_Set'Elab_Spec;
      Gtk.Icon_Set'Elab_Body;
      E342 := E342 + 1;
      Gtk.Image'Elab_Spec;
      Gtk.Image'Elab_Body;
      E340 := E340 + 1;
      Gtk.Gentry'Elab_Spec;
      Gtk.Window'Elab_Spec;
      Gtk.Dialog'Elab_Spec;
      Gtk.Print_Operation'Elab_Spec;
      E239 := E239 + 1;
      Gdk.Display'Elab_Body;
      E249 := E249 + 1;
      Gdk.Frame_Clock'Elab_Body;
      E265 := E265 + 1;
      Gtk.Accel_Group'Elab_Body;
      E271 := E271 + 1;
      Gtk.Adjustment'Elab_Body;
      E320 := E320 + 1;
      Gtk.Cell_Area'Elab_Body;
      E330 := E330 + 1;
      E322 := E322 + 1;
      Gtk.Cell_Renderer'Elab_Body;
      E336 := E336 + 1;
      Gtk.Container'Elab_Body;
      E237 := E237 + 1;
      Gtk.Dialog'Elab_Body;
      E243 := E243 + 1;
      E324 := E324 + 1;
      Gtk.Entry_Buffer'Elab_Body;
      E326 := E326 + 1;
      Gtk.Entry_Completion'Elab_Body;
      E328 := E328 + 1;
      Gtk.Gentry'Elab_Body;
      E312 := E312 + 1;
      Gtk.Notebook'Elab_Body;
      E352 := E352 + 1;
      Gtk.Print_Operation'Elab_Body;
      E354 := E354 + 1;
      E366 := E366 + 1;
      Gtk.Status_Bar'Elab_Body;
      E370 := E370 + 1;
      Gtk.Style'Elab_Body;
      E275 := E275 + 1;
      Gtk.Style_Context'Elab_Body;
      E346 := E346 + 1;
      Gtk.Tree_Model'Elab_Body;
      E338 := E338 + 1;
      Gtk.Widget'Elab_Body;
      E257 := E257 + 1;
      Gtk.Window'Elab_Body;
      E306 := E306 + 1;
      Gdk.Cursor'Elab_Spec;
      E475 := E475 + 1;
      Glib.Menu_Model'Elab_Spec;
      Glib.Menu_Model'Elab_Body;
      E384 := E384 + 1;
      E477 := E477 + 1;
      Gtk.Action'Elab_Spec;
      Gtk.Action'Elab_Body;
      E388 := E388 + 1;
      Gtk.Activatable'Elab_Spec;
      E392 := E392 + 1;
      Gtk.Button'Elab_Spec;
      Gtk.Button'Elab_Body;
      E455 := E455 + 1;
      Gtk.Cell_Renderer_Pixbuf'Elab_Spec;
      Gtk.Cell_Renderer_Pixbuf'Elab_Body;
      E493 := E493 + 1;
      Gtk.Clipboard'Elab_Spec;
      Gtk.Clipboard'Elab_Body;
      E461 := E461 + 1;
      Gtk.Css_Provider'Elab_Spec;
      Gtk.Css_Provider'Elab_Body;
      E483 := E483 + 1;
      Gtk.Grange'Elab_Spec;
      Gtk.Grange'Elab_Body;
      E527 := E527 + 1;
      Gtk.Icon_Theme'Elab_Spec;
      Gtk.Icon_Theme'Elab_Body;
      E485 := E485 + 1;
      E396 := E396 + 1;
      E467 := E467 + 1;
      Gtk.Menu_Item'Elab_Spec;
      Gtk.Menu_Item'Elab_Body;
      E386 := E386 + 1;
      Gtk.Image_Menu_Item'Elab_Spec;
      Gtk.Image_Menu_Item'Elab_Body;
      E471 := E471 + 1;
      Gtk.Menu_Shell'Elab_Spec;
      Gtk.Menu_Shell'Elab_Body;
      E394 := E394 + 1;
      Gtk.Menu'Elab_Spec;
      Gtk.Menu'Elab_Body;
      E382 := E382 + 1;
      Gtk.Label'Elab_Spec;
      Gtk.Label'Elab_Body;
      E380 := E380 + 1;
      Gtk.Scrollable'Elab_Spec;
      E517 := E517 + 1;
      Gtk.Scrollbar'Elab_Spec;
      Gtk.Scrollbar'Elab_Body;
      E525 := E525 + 1;
      Gtk.Scrolled_Window'Elab_Spec;
      Gtk.Scrolled_Window'Elab_Body;
      E523 := E523 + 1;
      Gtk.Table'Elab_Spec;
      Gtk.Table'Elab_Body;
      E539 := E539 + 1;
      Gtk.Text_Child_Anchor'Elab_Spec;
      Gtk.Text_Child_Anchor'Elab_Body;
      E507 := E507 + 1;
      Gtk.Text_Tag_Table'Elab_Spec;
      Gtk.Text_Tag_Table'Elab_Body;
      E511 := E511 + 1;
      Gtk.Text_Buffer'Elab_Spec;
      Gtk.Text_Buffer'Elab_Body;
      E505 := E505 + 1;
      Gtk.Text_View'Elab_Spec;
      Gtk.Text_View'Elab_Body;
      E529 := E529 + 1;
      Gtk.Toggle_Button'Elab_Spec;
      Gtk.Toggle_Button'Elab_Body;
      E459 := E459 + 1;
      Gtk.Check_Button'Elab_Spec;
      Gtk.Check_Button'Elab_Body;
      E457 := E457 + 1;
      Gtk.Tooltip'Elab_Spec;
      Gtk.Tooltip'Elab_Body;
      E519 := E519 + 1;
      E497 := E497 + 1;
      E499 := E499 + 1;
      Gtk.Tree_Selection'Elab_Spec;
      Gtk.Tree_Selection'Elab_Body;
      E521 := E521 + 1;
      E501 := E501 + 1;
      Gtk.List_Store'Elab_Spec;
      Gtk.List_Store'Elab_Body;
      E495 := E495 + 1;
      Gtk.Tree_Store'Elab_Spec;
      Gtk.Tree_Store'Elab_Body;
      E513 := E513 + 1;
      Gtk.Tree_View_Column'Elab_Spec;
      Gtk.Tree_View_Column'Elab_Body;
      E469 := E469 + 1;
      Gtk.Tree_View'Elab_Spec;
      Gtk.Tree_View'Elab_Body;
      E515 := E515 + 1;
      Gtk.Missed'Elab_Spec;
      Gtk.Missed'Elab_Body;
      E473 := E473 + 1;
      Gtk.Main.Router'Elab_Spec;
      Gtk.Main.Router'Elab_Body;
      E398 := E398 + 1;
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
   --   D:\GNAT\2020\include\gtkada_contributions_3_28\glib-wrappers.o
   --   D:\GNAT\2020\include\gtkada_contributions_3_28\gdk-color-ihls.o
   --   D:\GNAT\2020\include\gtkada_contributions_3_28\glib-object-checked_destroy.o
   --   D:\GNAT\2020\include\gtkada_contributions_3_28\gtk-missed.o
   --   D:\GNAT\2020\include\gtkada_contributions_3_28\gtk-main-router.o
   --   C:\Users\Worso\Documents\GitHub\ConcurrentZOO\obj\concurrent_zoo.o
   --   -LC:\Users\Worso\Documents\GitHub\ConcurrentZOO\obj\
   --   -LC:\Users\Worso\Documents\GitHub\ConcurrentZOO\obj\
   --   -LD:\GNAT\2020\include\gtkada_contributions_3_28\
   --   -LD:\GtkAda\lib\gtkada\gtkada.static\gtkada\
   --   -LD:/gnat/2020/lib/gcc/x86_64-pc-mingw32/9.3.1/adalib/
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
