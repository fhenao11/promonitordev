package com.advanceRealty.upload;

import org.apache.struts.action.*;
import org.apache.struts.upload.FormFile;



/**
* @author Deepak Kumar
* @Web http://www.roseindia.net
* @Email roseindia_net@yahoo.com
*/

/**
 * Form bean for Struts File Upload.
 *
*/
public class StrutsUploadForm extends ActionForm
{
  private FormFile theFile;
  private String dirType;   //(web|docs|images) web images,docs or info images

  /**
   * @return Returns the theFile.
   */
  public FormFile getTheFile() {
    return theFile;
  }
  /**
   * @param theFile The FormFile to set.
   */
  public void setTheFile(FormFile theFile) {
    this.theFile = theFile;
  }
/**
 * @return the dirType
 */
public String getDirType() {
	return dirType;
}
/**
 * @param dirType the dirType to set
 */
public void setDirType(String dirType) {
	this.dirType = dirType;
}
  
 
} 