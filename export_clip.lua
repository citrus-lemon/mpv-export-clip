utils = require "mp.utils"

function export_loop_clip()
  local a = mp.get_property_number("ab-loop-a")
  local b = mp.get_property_number("ab-loop-b")
  local screenshot_folder = mp.get_property("screenshot-directory") or ""
  local path = mp.get_property("path")
  local basename = mp.get_property("filename"):gsub("%.([^%.]+)$", "")
  if a and b then
    local inc = 0
    local outfile
    repeat
      local num = string.format("%04d",inc)
      outfile = utils.join_path(
        screenshot_folder,
        basename .. '-' .. num .. '.mp4'
      )
      local is_file = utils.file_info(outfile)
      inc = inc + 1
    until (not is_file)
    local cmd = {
      'ffmpeg',
      '-ss', tostring(a),
      '-i', path,
      '-t', tostring(b-a),
      '-vcodec', 'libx264',
      '-an', '-sn',
      '-crf', '22',
      '-pix_fmt', 'yuv420p',
      '-filter_complex', 'scale=iw*min(1\\,min(1280/iw\\,720/ih)):-2',
      '-map', '0',
      '-v', '16',
      outfile
    }
    local args = { args = cmd }
    local result = utils.subprocess(args)
    if result["status"] == "0" then
      mp.msg.info('save clip ' .. outfile)
      mp.osd_message('save clip ' .. outfile)
    else
      mp.msg.info(result["error_string"] .. result["status"])
      mp.osd_message("export loop clip error")
    end
  end
end
mp.register_script_message("export-loop-clip", export_loop_clip)
