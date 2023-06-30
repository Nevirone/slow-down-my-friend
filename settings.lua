data:extend{
  {
    name = "slowdown-enabled",
    type = "bool-setting",
    setting_type = "runtime-global",
    default_value = false,
    order = "a"
  },
  {
    name = "slowdown-factor",
    type = "double-setting",
    setting_type = "runtime-global",
    minimum_value = 0,
    maximum_value = 1,
    default_value = 0.02,
    order = "b"
  }
}
