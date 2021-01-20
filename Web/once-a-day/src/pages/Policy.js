import React from 'react';
import Content from '../components/Content';
import Myself from '../components/Myself';

function About(props) {
    return(
        <div>
            <Myself subTitle={props.subTitle} />
            <div style={{ backgroundColor: 'white', opacity: 0.6 }}>
                <Content>
                    <p>
                        <p>Privacy Policy</p>
                        <p>Martin Kuchar built the Ypin app as a Free app. This SERVICE is provided by Martin Kuchar at no cost and is intended for use as is.
                            This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.
                            If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.
                            The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Ypin unless otherwise defined in this Privacy Policy.</p>
                        <p>Information Collection and Use</p>
                        <p>For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information. The information that I request will be retained on your device and is not collected by me in any way.</p>
                        <p>Log Data</p>
                        <p>I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.</p>
                        <p>Cookies</p>
                        <p>Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.
                            This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.</p>
                        <p>Service Providers</p>
                        <p>I may employ third-party companies and individuals due to the following reasons:</p>
                        <p>To facilitate our Service;</p>
                        <p>To provide the Service on our behalf;</p>
                        <p>To perform Service-related services; or</p>
                        <p>
                            To assist us in analyzing how our Service is used. To provide AR experiences. In order to do this, Ypin needs to local derive AR geospatial data from your device camera.
                            To collect location data. By enabling precise location, you allow Ypin to collect, store and use your precise location, such as GPS information.
                            I want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.</p>
                        <p>Security</p>
                        <p>I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.</p>
                    ​    <p>Links to Other Sites</p>
                            <p>This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.</p>
                    ​    <p>Children’s Privacy</p>
                    ​    <p>These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do necessary actions.</p>
                    ​    <p>Changes to This Privacy Policy</p>
                    ​    <p>I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.</p>
                    ​    <p>This policy is effective as of 2020-12-17</p>
                    </p>

                </Content>
            </div>
        </div>
    );
};

export default About;